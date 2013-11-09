class User < ActiveRecord::Base
include Clearance::User

  include Clearance::User
  has_many :topics
  validates_length_of :password, { minimum: 6 }
end
