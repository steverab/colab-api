class App < Sinatra::Application

	before do
		# ...
	end

	# ------------------------
	# -- Routes
	# ------------------------

	get "/requests" do
		@request = Request.all
		@request.to_json
	end

end
