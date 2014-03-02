require "sinatra/cyclist"
require 'dashing'
require 'haml'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
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