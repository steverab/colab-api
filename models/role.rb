class Role < ActiveRecord::Base
  has_many :contest_user_roles
  has_many :contests, through: :contest_user_roles
  has_many :users, through: :contest_user_roles
end
