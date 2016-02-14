require 'sinatra'
require 'sinatra/activerecord'
require 'rest-client'

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'

class App < Sinatra::Application
	before do
		content_type :json

		if Sinatra::Base.production?

			response = RestClient.get "http://ip-api.com/json/18.189.23.225?fields=38911"
			parsed_response = JSON.parse(response)

			# TODO: Link to user if possible

			Request.create(:ip => request.ip, :path => request.path, :method => request.request_method, :query_string => request.query_string, :user_agent => request.user_agent, :city => parsed_response["city"], :region_code => parsed_response["region"], :region => parsed_response["regionName"], :zip => parsed_response["zip"], :country => parsed_response["country"], :country_code => parsed_response["countryCode"], :lat => parsed_response["lat"], :lon => parsed_response["lon"], :isp => parsed_response["isp"], :organization => parsed_response["org"], :reverse => parsed_response["reverse"], :timezone => parsed_response["timezone"])
		end

	end

	helpers do
		# ...
	end

	configure :development do
		ActiveRecord::Base.establish_connection(
			:adapter  => "mysql2",
			:host     => "localhost",
			:username => "root",
			:password => "masterkey",
			:database => "climatecolab"
		)
		set :show_exceptions, true
	end

	configure :production do
		db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

		ActiveRecord::Base.establish_connection(
			:adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
		)
end

	get "/" do
		content_type :txt
    "Welcome to the CoLab API!"
  end
end
