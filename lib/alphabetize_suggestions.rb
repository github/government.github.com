# frozen_string_literal: true

require 'digest'
require 'open3'
require 'tempfile'
require_relative 'alphabetize'

module AlphabetizeSuggestions
  def self.visible_lines(patch)
    line = 0
    patch.to_s.lines.each_with_object(Set.new) do |text, lines|
      if (match = text.match(/^@@ -\d+(?:,\d+)? \+(\d+)(?:,\d+)? @@/))
        line = match[1].to_i
      elsif text.start_with?(' ', '+')
        lines << line
        line += 1
      end
    end
  end

  def self.diff(original, formatted, context: 0)
    Tempfile.create('alphabetize-original') do |before|
      Tempfile.create('alphabetize-formatted') do |after|
        before.write(original)
        after.write(formatted)
        [before, after].each(&:flush)
        output, error, status = Open3.capture3('diff', "-U#{context}", '--', before.path, after.path)
        raise "Cannot generate formatting diff: #{error}" unless [0, 1].include?(status.exitstatus)

        output
      end
    end
  end

  def self.replacement(original, formatted)
    before = original.lines
    after = formatted.lines
    prefix = 0
    prefix += 1 while prefix < [before.length, after.length].min && before[prefix] == after[prefix]
    suffix = 0
    suffix += 1 while suffix < [before.length, after.length].min - prefix && before[-suffix - 1] == after[-suffix - 1]
    count = before.length - prefix - suffix
    [count.zero? ? prefix : prefix + 1, count, after.slice(prefix, after.length - prefix - suffix)]
  end

  def self.comment(path, start, count, replacement, original)
    if count.zero?
      anchor = [start, 1].max
      replacement = start.zero? ? replacement + [original.first] : [original[anchor - 1]] + replacement
      start = anchor
      count = 1
    end
    text = replacement.join
    text += "\n" unless text.empty? || text.end_with?("\n")
    fence = '`' * [3, text.scan(/`+/).map(&:length).max.to_i + 1].max
    body = "Alphabetize and normalize organization data:\n\n#{fence}suggestion\n#{text}#{fence}"
    marker = "<!-- alphabetize:#{Digest::SHA256.hexdigest([path, start, count, body].join("\n"))} -->"
    result = { path: path, line: start + count - 1, side: 'RIGHT', body: "#{body}\n#{marker}" }
    result.merge!(start_line: start, start_side: 'RIGHT') if count > 1
    result
  end

  def self.for_file(path, original, patch)
    raise ArgumentError, 'Unsafe organization data path' unless path.match?(%r{\A_data/[A-Za-z0-9_-]+\.yml\z})

    formatted = Alphabetize.format(original)
    return [[], false, ''] if formatted == original

    visible = visible_lines(patch)
    # One replacement keeps moves atomic, even when only their source is in the PR diff.
    suggestion = comment(path, *replacement(original, formatted), original.lines)
    first = suggestion.fetch(:start_line, suggestion.fetch(:line))
    reviewable = (first..suggestion.fetch(:line)).all? { |line| visible.include?(line) }
    incomplete = !reviewable || suggestion.fetch(:body).bytesize >= 60_000
    comments = incomplete ? [] : [suggestion]
    fallback = diff(original, formatted, context: 3)
    [comments, incomplete, "--- a/#{path}\n+++ b/#{path}\n#{fallback.lines.drop(2).join}"]
  end
end
