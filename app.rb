require 'sinatra'
require 'sinatra/activerecord'

class App < Sinatra::Application
	before do
		content_type :json
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

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'
