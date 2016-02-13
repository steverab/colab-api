class App < Sinatra::Application
	
	before do
		# ...
	end

	# ------------------------
	# -- Routes
	# ------------------------

	get "/contests" do
		returned_contests = []

		for contest in Contest.all
			returned_contests << contest.as_json(:except => :description)
		end

		returned_contests.to_json
	end

	post "/contests/create" do
		name = params[:name]
		shortName = params[:short_name]
		description = params[:description]
		authorID = params[:author_id]

		contest = Contest.create(:name => name, :short_name => shortName, :description => description)
		ContestUserRole.create(:contest_id => contest.id, :user_id => authorID, :role_id => 2)

		contest.to_json
	end

	get "/contests/:id" do
		contest = Contest.find(params[:id])

		authors = fetch_users_for_contest_and_role(contest, 2)
		advisors = fetch_users_for_contest_and_role(contest, 3)
		fellows = fetch_users_for_contest_and_role(contest, 4)
		judges = fetch_users_for_contest_and_role(contest, 5)

		returned_contest = contest.as_json
		returned_contest["author"] = authors.first.as_json(:only => [:id, :first_name, :last_name])
		returned_contest["advisors"] = advisors.as_json(:only => [:id, :first_name, :last_name])
		returned_contest["fellows"] = fellows.as_json(:only => [:id, :first_name, :last_name])
		returned_contest["judges"] = judges.as_json(:only => [:id, :first_name, :last_name])

		returned_contest.to_json
	end

	# ------------------------
	# -- Local helpers
	# ------------------------

	def fetch_users_for_contest_and_role (contest, role_id)
		users_for_role = []

		for contestUserRole in ContestUserRole.joins(:contest, :role).where(:contest_id => contest.id, :role_id => role_id)
			users_for_role << User.find(contestUserRole.user_id)
		end

		users_for_role
	end

end
