# frozen_string_literal: true

require 'minitest/autorun'
require 'fileutils'
require 'json'
require 'open3'
require 'tmpdir'
require 'yaml'

module EnsureOrgsFixtures
  def git!(dir, *)
    output, status = Open3.capture2e('git', '-C', dir, *)
    raise output unless status.success?
  end

  def write_baseline(dir, baseline)
    git!(dir, 'init', '--quiet')
    baseline.each do |name, data|
      File.write("#{dir}/_data/#{name}.yml", "# Organizations\n\n#{data.to_yaml.sub(/\A---\n/, '')}")
    end
    git!(dir, 'add', '_data')
    git!(dir, '-c', 'user.name=Test', '-c', 'user.email=test@example.com', '-c', 'commit.gpgsign=false',
         'commit', '--quiet', '-m', 'Baseline')
    baseline.each_key { |name| File.delete("#{dir}/_data/#{name}.yml") }
  end

  def write_responses(dir)
    File.write("#{dir}/responses.rb", <<~RUBY)
      require 'typhoeus'
      require 'json'
      Typhoeus::Config.block_connection = true
      Typhoeus.stub('https://api.github.com/graphql').and_return do |request|
        raise 'Missing authentication' unless request.options[:headers]['Authorization'] == 'Bearer test-token'
        body = JSON.parse(request.options.fetch(:body))
        codes = JSON.parse(ENV.fetch('ORG_RESPONSES'))
        data = {}
        errors = []
        body.fetch('variables').each do |variable, org|
          result = codes.fetch(org)
          name = variable.sub('login', 'org')
          raise 'Missing query alias' unless body.fetch('query').include?("\#{name}: organization(login: $\#{variable})")
          data[name] = result == 200 ? { 'login' => org } : nil
          errors << { 'type' => result == 404 ? 'NOT_FOUND' : result, 'path' => [name] } unless result == 200
        end
        options = JSON.parse(ENV.fetch('RESPONSE_OPTIONS'))
        Typhoeus::Response.new(
          code: options.fetch('code', 200), return_code: options.fetch('return_code', 'ok').to_sym,
          body: options.fetch('body') { JSON.generate('data' => data, 'errors' => errors) }
        )
      end
    RUBY
  end

  def run_check(codes, baseline: nil, current: nil, base_ref: nil, **options)
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p("#{dir}/script")
      FileUtils.mkdir_p("#{dir}/_data")
      FileUtils.cp(File.expand_path('../script/ensure-orgs', __dir__), "#{dir}/script/ensure-orgs")
      data_path = "#{dir}/_data/orgs.yml"
      if baseline
        write_baseline(dir, baseline)
        base_ref ||= 'HEAD'
      end
      current ||= { 'Test' => codes.keys }
      File.write(data_path, "# Organizations\n\n#{current.to_yaml.sub(/\A---\n/, '')}")
      write_responses(dir)
      output, status = Open3.capture2e(
        { 'ORG_RESPONSES' => codes.to_json, 'ORG_BASE_REF' => base_ref, 'GITHUB_TOKEN' => options.fetch(:token, 'test-token'),
          'RESPONSE_OPTIONS' => options.fetch(:response, {}).to_json },
        Gem.ruby, '-r', "#{dir}/responses.rb", "#{dir}/script/ensure-orgs"
      )
      [output, status, YAML.safe_load_file(data_path).values.flatten]
    end
  end
end

class EnsureOrgsTest < Minitest::Test
  include EnsureOrgsFixtures

  def test_unavailable_responses_are_inconclusive_and_retained
    codes = { 'org' => 200, 'forbidden' => 'FORBIDDEN', 'limited' => 'RATE_LIMITED' }
    output, status, entries = run_check(codes)

    assert status.success?, output
    assert_equal codes.keys, entries
    assert_includes output, 'Skipped 2 organization checks'
    assert_includes output, 'Responses (1 total):'
    assert_includes output, 'HTTP 200: 1'
    assert_includes output, 'GraphQL error: 2'
    codes.keys.drop(1).each { |org| refute_includes output, "#{org}:" }
    refute_includes output, 'All orgs check out.'
  end

  def test_not_found_still_fails_without_removing_inconclusive_entries
    output, status, entries = run_check({ 'org' => 200, 'user' => 404, 'limited' => 'RATE_LIMITED' })

    assert_equal 1, status.exitstatus, output
    assert_equal %w[org limited], entries
    assert_includes output, 'not organizations or no longer exist'
    assert_includes output, "(GraphQL NOT_FOUND):\n\nuser\n"
    assert_includes output, 'NOT_FOUND: 1'
    assert_includes output, 'Skipped 1 organization checks'
  end

  def test_successful_checks_report_success
    output, status, entries = run_check({ 'org' => 200 })

    assert status.success?, output
    assert_equal ['org'], entries
    assert_includes output, 'All orgs check out.'
    refute_includes output, 'Skipped'
  end

  def test_incremental_check_only_requests_added_and_renamed_orgs
    baseline = { 'old' => { 'Old group' => %w[existing renamed-old removed] } }
    current = { 'New group' => %w[Existing renamed-new added] }
    output, status, entries = run_check(
      { 'renamed-new' => 404, 'added' => 200 }, baseline: baseline, current: current
    )

    assert_equal 1, status.exitstatus, output
    assert_equal %w[Existing added], entries
    assert_includes output, 'Responses (1 total):'
    assert_includes output, "(GraphQL NOT_FOUND):\n\nrenamed-new\n"
  end

  class EnsureOrgsGraphqlTest < Minitest::Test
    include EnsureOrgsFixtures

    def test_large_lists_are_split_into_batches
      codes = 101.times.to_h { |index| ["org-#{index}", 200] }
      output, status, entries = run_check(codes)

      assert status.success?, output
      assert_equal codes.keys, entries
      assert_includes output, 'Responses (3 total):'
      assert_includes output, 'Organization: 101'
    end

    def test_http_and_network_failures_retain_entries
      [0, 403, 404, 429, 500, 503].each do |code|
        response = { code: code, return_code: code.zero? ? 'operation_timedout' : 'ok' }
        output, status, entries = run_check({ 'org' => 200 }, response: response)

        assert status.success?, output
        assert_equal ['org'], entries
        assert_includes output, 'Skipped 1 organization checks'
        assert_includes output, code.zero? ? 'No HTTP response: 1' : "HTTP #{code}: 1"
      end
    end

    def test_malformed_and_global_errors_do_not_remove_entries
      bodies = ['not json', 'null', '{}', '{"data":{"org0":null}}',
                '{"errors":[{"type":"NOT_FOUND"}]}',
                '{"data":{"org0":{"login":"org"}},"errors":[{"type":"RATE_LIMITED"}]}']
      bodies.each do |body|
        output, status, entries = run_check({ 'org' => 200 }, response: { body: body })

        assert status.success?, output
        assert_equal ['org'], entries
        assert_includes output, 'Skipped 1 organization checks'
        refute_includes output, 'All orgs check out.'
      end
    end

    def test_missing_token_is_an_explicit_failure
      output, status, entries = run_check({ 'org' => 200 }, token: nil)

      refute status.success?, output
      assert_equal ['org'], entries
      assert_includes output, 'Set GITHUB_TOKEN'
    end
  end

  def test_moves_sorting_and_removals_do_not_request_orgs
    baseline = { 'old' => { 'Old group' => %w[zebra alpha removed] } }
    output, status, entries = run_check({}, baseline: baseline, current: { 'New group' => %w[alpha zebra] })

    assert status.success?, output
    assert_equal %w[alpha zebra], entries
    assert_includes output, 'Responses (0 total):'
  end

  def test_unavailable_baseline_fails_explicitly
    output, status, entries = run_check(
      { 'org' => 200 }, baseline: { 'orgs' => { 'Test' => ['org'] } }, base_ref: 'missing-ref'
    )

    refute status.success?, output
    assert_equal ['org'], entries
    assert_includes output, 'Cannot read organization baseline:'
  end

  def test_initial_push_checks_all_entries
    output, status, entries = run_check({ 'org' => 200 }, base_ref: '0' * 40)

    assert status.success?, output
    assert_equal ['org'], entries
    assert_includes output, 'Responses (1 total):'
  end
end
