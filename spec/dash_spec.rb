# require_relative '../safe_gorge'
require 'dashing'
require 'rack/test'
require 'sinatra'
# require 'timecop'

# welcome_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Gather numDigits=\"1\" action=\"/in-call/get\" method=\"post\"><Say>Welcome to York Street. Deliveries, please press 5.\n        For a joke, press 1.\n        To speak to a person, press 2.\n        To check your future, press 3.\n        If you know anything else, at all. Please enter it now!</Say></Gather><Say>Sorry, I didn't get your response</Say><Redirect>https://york-phone-gateway.herokuapp.com/in-call</Redirect></Response>"

describe 'Dash main page' do
  include Rack::Test::Methods


  def app
    Sinatra::Application
  end

  it "should load the index page" do
    get '/index'
    expect(last_response).to be_ok
    # expect(last_response.body).to contain()
  end

  it "should have the cats RandomAww" do
    get '/index'
    expect(last_response.body).to include('RandomAww')
  end

  it "should load the second page" do
    get '/second'
    expect(last_response).to be_ok
  end

end
