# frozen_string_literal: true

require 'html-proofer'

task :test do
  sh 'bundle exec jekyll build'
  proofer = HTMLProofer.check_directory(
    './_site/',
    check_html: true,
    hydra: { max_concurrency: 10 },
    url_ignore: [%r{https://developer.github.com}, %r{https://docs.github.com}, %r{https://help.github.com}],
    http_status_ignore: [429])
  proofer.before_request do |request|
    request.options[:headers]['Authorization'] = "Bearer #{GITHUB_TOKEN}" if request.base_url == "https://github.com"
  end
  proofer.run
end
