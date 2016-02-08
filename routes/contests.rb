class App < Sinatra::Application
	before do
		# ...
	end

	get "/contests" do
		@contests = Contest.all
		@contests.to_json
	end

	post "/contests/create" do
		# ...
	end

	get "/contests/:id" do
		@contest = Contest.find(params[:id])
		@contest.to_json
	end

end
