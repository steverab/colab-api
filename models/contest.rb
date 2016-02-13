class Contest < ActiveRecord::Base
  has_many :contest_user_roles
  has_many :users, through: :contest_user_roles
  has_many :roles, through: :contest_user_roles
end
