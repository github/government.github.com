require 'rack/contrib/try_static'
require 'rack/contrib/not_found'
 
use Rack::TryStatic,
  :root => "_site",
  :urls => %w[/],
  :try  => ['index.html', '/index.html']
 
run Rack::NotFound.new('_site/404.html')
