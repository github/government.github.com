require 'rubygems'
require 'sinatra/base'
require 'sinatra-index'

class JekyllSite < Sinatra::Base

  register Sinatra::Index
  use_static_index 'index.html'
  set :public_folder, '_site'

  get '/' do
    send_file File.join settings.public_folder, 'index.html'
  end

end

run JekyllSite.new