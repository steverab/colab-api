class App < Sinatra::Application
	before do
		# ...
	end

	get "/users" do
		@users = User.all
		@users.to_json
	end
	
	get "/users/:id" do
		@user = User.find(params[:id])
		@user.to_json
	end
	
	post "/users/signup" do
		# ...
	end
	
end
