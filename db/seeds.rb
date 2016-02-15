# Initial database table population file

# ------------------------------------------------------
# Create sample users
# ------------------------------------------------------

User.create(:first_name => "Stephan", :last_name => "Rabanser", :screen_name => "rabanser", :email => "rabanser@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)
User.create(:first_name => "Thomas", :last_name => "Malone", :screen_name => "malone", :email => "malone@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)
User.create(:first_name => "Laur", :last_name => "Fisher", :screen_name => "fisher", :email => "lfi@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)
User.create(:first_name => "Robert", :last_name => "Laubacher", :screen_name => "laubacher", :email => "rjl@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)
User.create(:first_name => "Johannes", :last_name => "Bachhuber", :screen_name => "bachhuber", :email => "jobachhu@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)
User.create(:first_name => "Carlos", :last_name => "Botelho", :screen_name => "botelho", :email => "carlosbp@mit.edu", :password => "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", :short_bio => nil)

# ------------------------------------------------------
# Create sample contests
# ------------------------------------------------------

Contest.create(:name => "Harnessing the power of MIT alumni", :short_name => "What is the most effective thing that MIT alumni can do to help implement the MIT Plan for Action on Climate Change?", :description => "MIT believes that a key to solving the climate change problem is to engage all sectors of society—governments, businesses, non-profits, philanthropists, and many others. As a first step in this broad engagement process, this contest focuses on a group that is very close to MIT: its global alumni network. This remarkable community of 130,000 people represents an exceptional untapped resource for addressing climate change. This contest seeks proposals for how this community can help implement MIT’s Plan for Action on Climate Change. Authors of winning proposals will be invited to present their ideas at a conference at MIT, and the MIT Alumni Association will help share the ideas widely in the MIT alumni community.")
Contest.create(:name => "Fostering Climate Collaboration in Boulder, CO", :short_name => "How can we build community engagement and connectivity around climate change?", :description => "Boulder is a community that houses, per capita, more tech and natural food start-ups, impact investors and entities working on behalf of our environment than anywhere in the world—boasting nearly 100 climate-oriented organizations and roughly 3,000 climate experts. Yet, with this bounty of committed community members, we lack awareness of one another, as well as cohesion and the ability to effectively align our collective agendas for greater impact. We’ve found that we are not alone; lack of collaboration is a struggle recognized in many communities, nationally and internationally and is often due to a shortage of resources—time and money—to collaborate. This contest is seeking dynamic, self-renewing platforms that will build community engagement and help leverage and coordinate existing efforts in the community for a magnified impact. Note that we are not seeking outright climate change mitigation solutions—we have an abundance of those. Rather, our goal is to foster enhanced collaboration and greater understanding of community action partners—and identifying them is our first step. While this contest is soliciting ideas for Boulder, CO, we encourage proposals that can be adopted by communities worldwide.")
Contest.create(:name => "Designing High Density Urban Bike Parking", :short_name => "Is there a design solution that provides high-density, accessible, cost-effective bicycle parking in the urban context?", :description => "We need to improve the quality and quantity of bike parking spaces in Kendall Square. We are not alone -- inadequate bike parking is a challenge faced by almost every city in the US and around the world. The Kendall Square EcoDistrict, located in Kendall Square, Cambridge, is working to make Kendall as bike friendly as possible. A bike friendly Kendall Square requires ample safe and secure bike parking in accessible locations throughout Kendall Square. As more and more residents, visitors, and commuters have chosen bicycles as their preferred mode of transportation, the availability of high-quality bike parking at certain locations has been inadequate. This competition aims to solve the problem by revealing design solutions that provide high-density, accessible, cost-effective bicycle parking in and around Kendall Square for all types of users. The Kendall Square EcoDistrict Steering Committee is looking for ideas to expand bike parking in Kendall Square by parking more bikes in less space, and making sure everyone can park whatever bike they are riding. The EcoDistrict seeks innovative designs that are flexible, decentralized, and customizable for use in a range of locations. While this competition is focused on the Kendall Square EcoDistrict, designs can be applied to other cities. We envision the winners of this design competition proposing designs that the EcoDistrict can review and potentially prototype in Kendall Square...and then bring to the world.")

# ------------------------------------------------------
# Create sample roles
# ------------------------------------------------------

Role.create(:name => "Admin") # -> 1
Role.create(:name => "Author") # -> 2
Role.create(:name => "Advisor") # -> 3
Role.create(:name => "Fellow") # -> 4
Role.create(:name => "Judge") # -> 5

# ------------------------------------------------------
# Create sample contests <-> users <-> roles links
# ------------------------------------------------------

ContestUserRole.create(:contest_id => 1, :user_id => 1, :role_id => 2)
ContestUserRole.create(:contest_id => 1, :user_id => 4, :role_id => 3)
ContestUserRole.create(:contest_id => 1, :user_id => 5, :role_id => 3)
ContestUserRole.create(:contest_id => 1, :user_id => 3, :role_id => 4)
ContestUserRole.create(:contest_id => 1, :user_id => 2, :role_id => 5)
