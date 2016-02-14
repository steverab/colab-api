class User < ActiveRecord::Base
  has_many :contest_user_roles
  has_many :contests, through: :contest_user_roles
  has_many :roles, through: :contest_user_roles
  has_many :requests
end
