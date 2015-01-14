# require_relative '../safe_gorge'
require 'rack/test'
# require 'timecop'

# welcome_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Gather numDigits=\"1\" action=\"/in-call/get\" method=\"post\"><Say>Welcome to York Street. Deliveries, please press 5.\n        For a joke, press 1.\n        To speak to a person, press 2.\n        To check your future, press 3.\n        If you know anything else, at all. Please enter it now!</Say></Gather><Say>Sorry, I didn't get your response</Say><Redirect>https://york-phone-gateway.herokuapp.com/in-call</Redirect></Response>"

describe 'Dash main page' do 
  include Rack::Test::Methods

  it "should load the home page and feed Pandas" do
    get '/index'
    expect(last_response).to be_ok
    expect(last_response.body).to contain()
  end

end
