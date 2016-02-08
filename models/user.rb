class User < ActiveRecord::Base
  has_many :contests
end
