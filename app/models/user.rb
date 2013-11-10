class User < ActiveRecord::Base
include Clearance::User

  include Clearance::User
  has_many :topics
  has_many :snippets, through: :topics
  validates_length_of :password, { minimum: 6 }
end
