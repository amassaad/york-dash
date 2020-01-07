require 'dashing'
require 'sinatra'
require 'rack/test'

describe 'Dash main page' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should load the index page" do
    get '/index'
    expect(last_response).to be_ok
  end

  it "should have the cats RandomAww" do
    get '/index'
    expect(last_response.body).to include('RandomAww')
  end

  it "should have the cats RandomCats" do
    get '/index'
    expect(last_response.body).to include('RandomCats')
  end

  it "should have the Clock" do
    get '/index'
    expect(last_response.body).to include('Clock')
  end

  it "should have the Verbinski weather widget" do
    get '/index'
    expect(last_response.body).to include('Verbinski')
  end

  it "should load the second page" do
    get '/second'
    expect(last_response).to be_ok
  end
end
