# frozen_string_literal: true

require 'yaml'

module Alphabetize
  def self.organization_list?(key, value)
    key.is_a?(String) && value.is_a?(Array) && value.all?(String)
  end

  def self.format(contents)
    data = YAML.safe_load(contents)
    valid = data.is_a?(Hash) && data.all? { |key, value| organization_list?(key, value) }
    raise ArgumentError, 'Organization data must map group names to lists of strings' unless valid

    output = data.sort_by { |key, _value| key.upcase }.to_h.transform_values { |value| value.uniq.sort_by(&:upcase) }
    # Preserve the data file's header comment and canonical spacing.
    contents.lines.first + output.to_yaml.gsub(/^(.+?):$/, "\n\\1:").gsub(/^- /, '  - ').gsub(/\A---\n/m, '')
  end
end
