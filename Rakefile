require 'html/proofer'

task :test do
  sh "bundle exec jekyll build"
  tester = HTML::Proofer.new "./_site/", :href_ignore => [
    "https://github.com/github/government.github.com",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-09-17-design-a-street-with-streetmix.md",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-10-06-forking-your-city.md",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-09-26-philadelphia-gets-going-and-gets-open.md",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-09-03-project-open-data.md",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-10-01-sunlight.md",
    "http://prose.io#/github/government.github/com/blob/gh-pages/_posts/2013-10-14-canadian-web-experience-toolkit.md",
    "http://prose.io#github/government.github.com/new/master/_posts"
  ]
  tester.run
end
