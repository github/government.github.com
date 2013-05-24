require 'rubygems'
require 'sinatra/base'
require 'sinatra/auth/github'
require 'sinatra-index'

class JekyllSite < Sinatra::Base

  #init github_ouath
  enable :sessions
  set :github_options, {
    :scopes    => "user",
    :secret    => ENV['GITHUB_CLIENT_SECRET'],
    :client_id => ENV['GITHUB_CLIENT_ID'],
  }
  register Sinatra::Auth::Github

  #auth
  before do
    if ENV.include?('GITHUB_ORG_ID')
      pass if github_organization_authenticate!(ENV['GITHUB_ORG_ID'])
    end
    if ENV.include?('GITHUB_TEAM_ID')
      pass if github_team_authenticate!(ENV['GITHUB_TEAM_ID'])
    end
  end

  #static site servin'
  register Sinatra::Index
  use_static_index 'index.html'
  set :public_folder, '_site'

end

run JekyllSite.new
