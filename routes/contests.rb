class App < Sinatra::Application
	before do
		# ...
	end

	get "/contests" do
		@contests = Contest.all
		@contests.to_json
	end

	post "/contests/create" do
		name = params[:name]
		shortName = params[:short_name]
		description = params[:description]
		authorID = params[:author_id]

		@contest = Contest.create(:name => name, :short_name => shortName, :description => description, :author_id => authorID)

		@contest.to_json
	end

	get "/contests/:id" do
		@contest = Contest.find(params[:id])
		@contest.to_json
	end

end
