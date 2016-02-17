ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'
require 'test/unit'
require 'rack/test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  def test_my_default
    get '/'
    assert_equal 'Welcome to the CoLab API!', last_response.body
  end

  #def test_with_params
    #get '/meet', :name => 'Frank'
    #assert_equal 'Hello Frank!', last_response.body
  #end

  #def test_with_rack_env
    #get '/', {}, 'HTTP_USER_AGENT' => 'Songbird'
    #assert_equal "You're using Songbird!", last_response.body
  #end

end
