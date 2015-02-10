require "html/proofer"

task :test do
  sh "bundle exec jekyll build"
  HTML::Proofer.new("./_site/", {:check_html => true}).run
end
