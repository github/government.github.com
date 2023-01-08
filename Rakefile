# frozen_string_literal: true

require 'html-proofer'

task :test do
  sh 'bundle exec jekyll build'
  proofer = HTMLProofer.check_directory(
    './_site/',
    check_html: true,
    hydra: { max_concurrency: 10 },
    url_ignore: [%r{https://developer.github.com}, %r{https://docs.github.com}, %r{https://help.github.com}],
    ignore_status_codes: [429])
  token = ENV['GITHUB_TOKEN']
  proofer.before_request do |request|
    request.options[:headers]['Authorization'] = "Bearer #{token}" if request.base_url == "https://github.com"
  end
  proofer.run
end
