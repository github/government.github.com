# frozen_string_literal: true

require 'minitest/autorun'
require 'base64'
require 'fileutils'
require 'json'
require 'tmpdir'
require_relative '../lib/alphabetize_suggestions'

class AlphabetizeSuggestionsTest < Minitest::Test
  def test_sorting_and_spacing_match_the_existing_canonical_format
    original = "# Organizations\n\nZebra:  \n  - zoo\n  - apple\n  - apple\n\nAlpha:\n  - bee\n"
    expected = "# Organizations\n\nAlpha:\n  - bee\n\nZebra:\n  - apple\n  - zoo\n"

    assert_equal expected, Alphabetize.format(original)
    assert_equal expected, Alphabetize.format(expected)
  end

  module ReviewFixtures
    def run_review(existing: false, stale: false, extra_file: false, patch: "@@ -1,3 +1,3 @@\n # Data\n \n+Test:  \n", **options)
      Dir.mktmpdir do |dir|
        original = options.fetch(:original, "# Data\n\nTest:  \n  - org\n")
        fixture = {
          'repo' => 'example/repo', 'existing' => existing, 'stale' => stale,
          'original' => original, 'patch' => patch, 'extra_file' => extra_file,
          'mismatched_blob' => options.fetch(:mismatched_blob, false)
        }
        File.write("#{dir}/fixture.json", JSON.generate(fixture))
        write_github_stub(dir)
        output, status = Open3.capture2e(
          { 'PATH' => "#{dir}:#{ENV.fetch('PATH')}", 'FIXTURE_DIR' => dir,
            'GITHUB_REPOSITORY' => 'example/repo', 'PR_NUMBER' => '123' },
          Gem.ruby, File.expand_path('../script/suggest-alphabetize', __dir__)
        )
        posted = File.exist?("#{dir}/review.json") ? JSON.parse(File.read("#{dir}/review.json")) : nil
        [output, status, posted]
      end
    end

    def write_github_stub(dir)
      File.write("#{dir}/gh", <<~RUBY)
        #!#{Gem.ruby}
        require #{File.expand_path('../lib/alphabetize_suggestions', __dir__).inspect}
        require 'json'
        require 'base64'
        dir = ENV.fetch('FIXTURE_DIR')
        f = JSON.parse(File.read("\#{dir}/fixture.json"))
        path = ARGV.fetch(1)
        response = case path
        when 'repos/example/repo/pulls/123'
          count_path = "\#{dir}/calls"
          count = File.exist?(count_path) ? File.read(count_path).to_i : 0
          File.write(count_path, count + 1)
          { state: 'open', head: { sha: f['stale'] && count.positive? ? 'changed' : 'head',
                                  repo: { full_name: 'contributor/fork' } } }
        when /\\/files\\?/
          files = [{ filename: '_data/test.yml', status: 'modified', sha: 'blob', patch: f['patch'] }]
          files << { filename: '_data/other.yml', status: 'modified', sha: 'other', patch: nil } if f['extra_file']
          [files]
        when /\\/comments\\?/
          comments = AlphabetizeSuggestions.for_file('_data/test.yml', f['original'], f['patch']).first
          [f['existing'] ? comments.map { |c| { user: { login: 'github-actions[bot]' }, commit_id: 'head', body: c[:body] } } : []]
        when 'repos/contributor/fork/contents/_data/test.yml?ref=head'
          { sha: f['mismatched_blob'] ? 'different-blob' : 'blob' }
        when 'repos/contributor/fork/contents/_data/other.yml?ref=head'
          { sha: 'other' }
        when 'repos/contributor/fork/git/blobs/blob'
          { size: f['original'].bytesize, content: Base64.strict_encode64(f['original']) }
        when 'repos/contributor/fork/git/blobs/other'
          { size: f['original'].bytesize, content: Base64.strict_encode64(f['original']) }
        when /\\/reviews\\?/
          [[]]
        when 'repos/example/repo/pulls/123/reviews'
          File.write("\#{dir}/review.json", STDIN.read)
          {}
        else
          abort "Unexpected API request: \#{ARGV.inspect}"
        end
        puts JSON.generate(response)
      RUBY
      FileUtils.chmod(0o755, "#{dir}/gh")
    end
  end

  class AlphabetizeReviewTest < Minitest::Test
    include ReviewFixtures

    def test_posts_review_on_exact_head_commit
      output, status, review = run_review

      assert status.success?, output
      assert_equal 'head', review.fetch('commit_id')
      assert_equal 'COMMENT', review.fetch('event')
      assert_equal '_data/test.yml', review.fetch('comments').first.fetch('path')
      assert_includes review.fetch('comments').first.fetch('body'), "Test:\n"
    end

    def test_does_not_repeat_existing_bot_suggestions
      output, status, review = run_review(existing: true)

      assert status.success?, output
      assert_nil review
    end

    def test_does_not_post_to_a_changed_head
      output, status, review = run_review(stale: true)

      refute status.success?, output
      assert_nil review
      assert_includes output, 'Pull request changed'
    end

    def test_rejects_file_from_a_transient_head_even_if_head_returns_to_original
      output, status, review = run_review(mismatched_blob: true)

      refute status.success?, output
      assert_nil review
      assert_includes output, 'Pull request file changed during formatting'
    end

    def test_canonical_non_ascii_yaml_does_not_produce_suggestions_or_fallback
      original = "# Data\n\nC\u00f4te:\n  - org\n"
      output, status, review = run_review(original: original, patch: nil)

      assert status.success?, output
      assert_nil review
      assert_includes output, 'No new inline formatting suggestions'
    end

    def test_non_ascii_names_are_preserved_in_real_corrections
      output, status, review = run_review(original: "# Data\n\nC\u00f4te:  \n  - org\n")

      assert status.success?, output
      assert_includes review.fetch('comments').first.fetch('body'), "C\u00f4te:\n"
    end

    def test_posts_patch_when_inline_comments_are_impossible
      output, status, review = run_review(patch: nil)

      assert status.success?, output
      assert_empty review.fetch('comments')
      assert_includes review.fetch('body'), '```diff'
      assert_includes review.fetch('body'), 'outside the PR diff'
    end

    def test_fallback_patch_formats_inline_only_files_too
      output, status, review = run_review(extra_file: true)

      assert status.success?, output
      assert_equal(['_data/test.yml'], review.fetch('comments').map { |comment| comment.fetch('path') })
      patch = review.fetch('body').split("```diff\n", 2).last.split('```', 2).first
      Dir.mktmpdir do |dir|
        FileUtils.mkdir_p("#{dir}/_data")
        original = "# Data\n\nTest:  \n  - org\n"
        %w[test other].each { |name| File.write("#{dir}/_data/#{name}.yml", original) }
        result, applied = Open3.capture2e('git', 'apply', '-', stdin_data: patch, chdir: dir)
        assert applied.success?, result
        %w[test other].each do |name|
          assert_equal Alphabetize.format(original), File.read("#{dir}/_data/#{name}.yml")
        end
      end
    end
  end

  def test_inline_suggestions_for_whitespace_and_reordering
    original = "# Organizations\n\nTest:  \n  - zebra\n  - alpha\n"
    comments, incomplete, patch = AlphabetizeSuggestions.for_file(
      '_data/test.yml', original, "@@ -1,3 +1,5 @@\n # Organizations\n \n-Test:\n+Test:  \n+  - zebra\n+  - alpha\n"
    )

    refute incomplete
    assert_equal 1, comments.length
    assert(comments.all? { |comment| comment[:side] == 'RIGHT' })
    assert_includes patch, "--- a/_data/test.yml\n+++ b/_data/test.yml\n"
    assert_includes comments.map { |comment| comment[:body] }.join, '```suggestion'
    assert(comments.all? { |comment| comment[:line] <= 5 })
    lines = original.lines
    comments.sort_by { |comment| -comment.fetch(:line) }.each do |comment|
      first = comment.fetch(:start_line, comment.fetch(:line))
      text = comment.fetch(:body).split("```suggestion\n", 2).last.split('```', 2).first
      lines[first - 1, comment.fetch(:line) - first + 1] = text.lines
    end
    assert_equal Alphabetize.format(original), lines.join
  end

  def test_insertions_anchor_to_an_existing_line
    comment = AlphabetizeSuggestions.comment('_data/test.yml', 2, 0, ["new\n"], %W[first\n second\n])

    assert_equal 2, comment[:line]
    assert_includes comment[:body], "```suggestion\nsecond\nnew\n```"
    first = AlphabetizeSuggestions.comment('_data/test.yml', 0, 0, ["new\n"], ["first\n"])
    assert_equal 1, first[:line]
    assert_includes first[:body], "```suggestion\nnew\nfirst\n```"
  end

  def test_multiline_and_deletion_suggestions
    comment = AlphabetizeSuggestions.comment('_data/test.yml', 3, 2, [], [])

    assert_equal 3, comment[:start_line]
    assert_equal 4, comment[:line]
    assert_equal 'RIGHT', comment[:start_side]
    assert_includes comment[:body], "```suggestion\n```"
  end

  def test_corrections_outside_the_pr_diff_have_a_patch_fallback
    original = "# Organizations\n\nTest:\n  - zebra\n  - alpha\n"
    comments, incomplete, patch = AlphabetizeSuggestions.for_file(
      '_data/test.yml', original, "@@ -1 +1 @@\n-# Old\n+# Organizations\n"
    )

    assert_empty comments
    assert incomplete
    assert_includes patch, '+  - zebra'
    assert_includes patch, '-  - zebra'
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p("#{dir}/_data")
      File.write("#{dir}/_data/test.yml", original)
      output, status = Open3.capture2e('git', 'apply', '-', stdin_data: patch, chdir: dir)
      assert status.success?, output
      assert_equal Alphabetize.format(original), File.read("#{dir}/_data/test.yml")
    end
  end

  def test_moves_are_not_offered_as_partial_deletion_suggestions
    original = "# Data\n\nTest:\n  - zebra\n  - alpha\n  - beta\n"
    comments, incomplete, patch = AlphabetizeSuggestions.for_file(
      '_data/test.yml', original, "@@ -3,1 +3,2 @@\n Test:\n+  - zebra\n"
    )

    assert_empty comments
    assert incomplete
    assert_includes patch, '-  - zebra'
    assert_includes patch, '+  - zebra'
  end

  def test_atomic_replacement_spans_separated_moves
    original = "# Data\n\nTest:\n  - zebra\n  - alpha\n  - gamma\n  - beta\n"
    formatted = Alphabetize.format(original)
    start, count, replacement = AlphabetizeSuggestions.replacement(original, formatted)
    lines = original.lines
    lines[start - 1, count] = replacement

    assert_equal formatted, lines.join
    assert_equal YAML.safe_load(original).values.flatten.sort, YAML.safe_load(lines.join).values.flatten.sort
  end

  def test_unsafe_paths_are_rejected_before_patch_generation
    paths = ["_data/test\n+++ b/other.yml", "_data/test\t.yml", '_data/"test.yml',
             '_data/test\\057other.yml', '_data/../other.yml', "_data/test\0.yml"]
    paths.each do |path|
      assert_raises(ArgumentError) { AlphabetizeSuggestions.for_file(path, "# Data\n\nTest:  \n  - org\n", nil) }
    end
  end

  def test_deleted_lines_do_not_advance_the_new_side_coordinates
    lines = AlphabetizeSuggestions.visible_lines("@@ -8,3 +8,3 @@\n unchanged\n-deleted\n+added\n last\n")

    assert_equal Set[8, 9, 10], lines
  end

  def test_untrusted_yaml_is_never_deserialized_into_objects
    assert_raises(Psych::DisallowedClass) { Alphabetize.format("--- !ruby/object:Object {}\n") }
    assert_raises(ArgumentError) { Alphabetize.format("# Data\nGroup: not-a-list\n") }
  end

  def test_markdown_fences_in_data_cannot_escape_suggestion
    comment = AlphabetizeSuggestions.comment('_data/test.yml', 1, 1, ["  - ```\n"], [])

    assert_includes comment[:body], "````suggestion\n  - ```\n````"
  end
end
