require 'rubygems'
require 'rack'
require 'warden'
require 'warden/github'

#inspired by https://github.com/raul/rack-static-boilerplate/blob/master/config.ru
module Rack
  class JekyllSite

    def initialize(app, options)
      @app = app
      @try = ['', *options.delete(:try)]
      @static = ::Rack::Static.new(lambda { [404, {}, []] }, options)
    end

    def call(env)

      auth!(env)

      orig_path = env['PATH_INFO']
      found = nil
      @try.each do |path|
        resp = @static.call(env.merge!({'PATH_INFO' => orig_path + path}))
        break if 404 != resp[0] && found = resp
      end
      found or @app.call(env.merge!('PATH_INFO' => orig_path))
    end

    def auth!(env)
      env['warden'].authenticate!  
      user = env['warden'].user
      if ENV.include?('GITHUB_ORG_ID')
        puts "ORG AUTH"
        Rack::JekyllSite::bounce! unless user.organization_member? ENV['GITHUB_ORG_ID']
      end
      if ENV.include?('GITHUB_TEAM_ID')
        puts "TEAM AUTH"
        Rack::JekyllSite::bounce! unless user.team_member? ENV['GITHUB_TEAM_ID']
      end
    end

    def self.bounce!
      puts "BOUNCE"
    end

  end
end

GITHUB_CONFIG = {
  :client_id     => ENV['GITHUB_CLIENT_ID'],
  :client_secret => ENV['GITHUB_CLIENT_SECRET'],
  :scope         => 'user'
}

use Rack::Session::Cookie, :secret => ENV['GITHUB_CLIENT_SECRET']

use Warden::Manager do |config|
  config.failure_app = lambda { |env| [ 401, { 'Content-Type'  => 'text/html' }, ['401 - Unauthorized'] ] }
  config.default_strategies :github
  config.scope_defaults :default, :config => GITHUB_CONFIG
end

use Rack::JekyllSite, :root => "_site", :urls => %w[/], :try => [ 'index.html', '/index.html']

run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }