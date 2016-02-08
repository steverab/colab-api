class Contest < ActiveRecord::Base
  has_one :user, foreign_key: "id"
end
