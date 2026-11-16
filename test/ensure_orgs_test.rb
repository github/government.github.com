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

  def run_check(codes, baseline: nil, current: nil, base_ref: nil)
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
      File.write("#{dir}/responses.rb", <<~RUBY)
        require 'typhoeus'
        require 'json'
        Typhoeus::Config.block_connection = true
        JSON.parse(ENV.fetch('ORG_RESPONSES')).each do |org, code|
          Typhoeus.stub("https://github.com/orgs/\#{org}/people").and_return(
            Typhoeus::Response.new(code: code, return_code: code.zero? ? :operation_timedout : :ok)
          )
        end
      RUBY
      output, status = Open3.capture2e(
        { 'ORG_RESPONSES' => codes.to_json, 'GITHUB_ACTIONS' => 'true', 'ORG_BASE_REF' => base_ref },
        Gem.ruby, '-r', "#{dir}/responses.rb", "#{dir}/script/ensure-orgs"
      )
      [output, status, YAML.safe_load_file(data_path).values.flatten]
    end
  end
end

class EnsureOrgsTest < Minitest::Test
  include EnsureOrgsFixtures

  def test_unavailable_responses_are_inconclusive_and_retained
    codes = { 'org' => 200, 'forbidden' => 403, 'limited' => 429, 'server-error' => 500,
              'unavailable' => 503, 'timeout' => 0, 'redirect' => 302 }
    output, status, entries = run_check(codes)

    assert status.success?, output
    assert_equal codes.keys, entries
    assert_includes output, 'Skipped 6 organization checks'
    assert_includes output, 'Responses (7 total):'
    assert_includes output, 'HTTP 403: 1'
    assert_includes output, 'HTTP 429: 1'
    assert_includes output, 'No HTTP response: 1'
    codes.keys.drop(1).each { |org| refute_includes output, "#{org}:" }
    refute_includes output, 'All orgs check out.'
  end

  def test_not_found_still_fails_without_removing_inconclusive_entries
    output, status, entries = run_check({ 'org' => 200, 'user' => 404, 'limited' => 429 })

    assert_equal 1, status.exitstatus, output
    assert_equal %w[org limited], entries
    assert_includes output, 'not organizations or no longer exist'
    assert_includes output, "(HTTP 404):\n\nuser\n"
    assert_includes output, 'HTTP 404: 1'
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
    assert_includes output, 'Responses (2 total):'
    assert_includes output, "(HTTP 404):\n\nrenamed-new\n"
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
