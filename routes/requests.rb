class App < Sinatra::Application

	before do
		# ...
	end

	# ------------------------
	# -- Routes
	# ------------------------

	get "/requests" do
		requests = Request.all
		requests.to_json
	end

end
