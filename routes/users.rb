class App < Sinatra::Application

	before do
		# ...
	end

	# ------------------------
	# -- Routes
	# ------------------------

	get "/users" do
		users = User.all
		users.to_json(:except => [:password, :updated_at])
	end

	post "/users" do
		firstName = params[:first_name]
		lastName = params[:last_name]
		screenName = params[:screen_name]
		email = params[:email]
		password = Digest::SHA256.hexdigest params[:password]
		shortBio = params[:short_bio]
		profilePicture = params[:profile_picture]

		user = User.create(:first_name => firstName, :last_name => lastName, :screen_name => screenName, :email => email, :password => password, :short_bio => shortBio, :profile_picture => profilePicture)

		user.to_json(:except => [:password, :updated_at])
	end

	get "/users/:id" do
		user = User.find(params[:id])
		user.to_json(:except => [:password, :updated_at])
	end

	put "/users/:id" do
		data = JSON.parse(request.body.string)

		data.each do |key, value|
			if key == "created_at" || key == "updated_at" || key == "is_admin" || key == "profile_picture"
				data.delete(key)
			end
		end

		if data["password"].present?
			data["password"] = Digest::SHA256.hexdigest data["password"]
		end

		user = User.find(params[:id])
		user.update(data)
		user.to_json(:except => [:password, :updated_at])
	end

	post "/users/login" do
		email = params[:email]
		password = Digest::SHA256.hexdigest params[:password]

		users = User.where("email = ? AND password = ?", email, password)

		if users == nil || users.empty?
			halt 404
		elsif users.count > 1
			halt 500
		else
			user = users.first
			user.to_json(:except => [:password, :updated_at])
		end
	end

end
