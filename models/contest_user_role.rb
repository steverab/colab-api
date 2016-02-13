class ContestUserRole < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user
  belongs_to :role
end
