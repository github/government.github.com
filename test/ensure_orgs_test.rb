# frozen_string_literal: true

require 'minitest/autorun'
require 'fileutils'
require 'json'
require 'open3'
require 'tmpdir'
require 'yaml'

class EnsureOrgsTest < Minitest::Test
  def run_check(codes)
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p("#{dir}/script")
      FileUtils.mkdir_p("#{dir}/_data")
      FileUtils.cp(File.expand_path('../script/ensure-orgs', __dir__), "#{dir}/script/ensure-orgs")
      data_path = "#{dir}/_data/orgs.yml"
      File.write(data_path, "# Organizations\n\nTest:\n#{codes.keys.map { |org| "  - #{org}\n" }.join}")
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
        { 'ORG_RESPONSES' => codes.to_json, 'GITHUB_ACTIONS' => 'true' },
        Gem.ruby, '-r', "#{dir}/responses.rb", "#{dir}/script/ensure-orgs"
      )
      [output, status, YAML.safe_load_file(data_path).fetch('Test')]
    end
  end

  def test_unavailable_responses_are_inconclusive_and_retained
    codes = { 'org' => 200, 'forbidden' => 403, 'limited' => 429, 'server-error' => 500,
              'unavailable' => 503, 'timeout' => 0, 'redirect' => 302 }
    output, status, entries = run_check(codes)

    assert status.success?, output
    assert_equal codes.keys, entries
    assert_includes output, 'Skipped 6 organization checks'
    assert_includes output, "::group::Inconclusive organization checks\n"
    assert_includes output, "::endgroup::\n"
    refute_includes output, 'All orgs check out.'
  end

  def test_not_found_still_fails_without_removing_inconclusive_entries
    output, status, entries = run_check('org' => 200, 'user' => 404, 'limited' => 429)

    assert_equal 1, status.exitstatus, output
    assert_equal %w[org limited], entries
    assert_includes output, 'not organizations or no longer exist'
    assert_includes output, 'Skipped 1 organization checks'
  end

  def test_successful_checks_report_success
    output, status, entries = run_check('org' => 200)

    assert status.success?, output
    assert_equal ['org'], entries
    assert_includes output, 'All orgs check out.'
    refute_includes output, 'Skipped'
  end
end
