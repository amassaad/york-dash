require 'openid/store/filesystem'
require 'omniauth/strategies/google_apps'
require "sinatra/cyclist"
require 'dashing'
require 'haml'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do

    def protected!
      redirect '/auth/g' unless session[:user_id]
    end

  end

  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :google_apps, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'g', :domain => 'atam.ca'
  end

  post '/auth/g/callback' do
    if auth = request.env['omniauth.auth'] 
      session[:user_id] = auth['info']['email']
      redirect '/'
    else
      redirect '/auth/failure'
    end
  end

  get '/auth/failure' do
    'Nope.'
  end
end

configure :production do
  require 'newrelic_rpm'
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

set :routes_to_cycle_through, [:dash_1, :dash_2]

run Sinatra::Application