class User < ActiveRecord::Base
include Clearance::User

  include Clearance::User
  has_many :topics
end
