require 'rubygems'
require 'sinatra/base'
require 'sinatra/auth/github'
require 'sinatra-index'

class JekyllSite < Sinatra::Base

  #init github_ouath
  enable :sessions
  set :github_options, {
    :scopes    => "",
    :secret    => ENV['GITHUB_CLIENT_SECRET'],
    :client_id => ENV['GITHUB_CLIENT_ID'],
  }
  register Sinatra::Auth::Github

  #auth
  before do
    pass if github_organization_authenticate!(ENV['GITHUB_ORG_ID'])
  end

  #static site servin'
  register Sinatra::Index
  use_static_index 'index.html'
  set :public_folder, '_site'

end

run JekyllSite.new