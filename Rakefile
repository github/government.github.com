require 'html/proofer'
require 'find'

task :test do
  Rake::Task["assets:precompile"].execute
  tester = HTML::Proofer.new "./_site"
  tester.run
end
