class User < ActiveRecord::Base
  has_many :contests, foreign_key: "author_id"
end
