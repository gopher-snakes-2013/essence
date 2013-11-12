class User < ActiveRecord::Base
  include Clearance::User
  has_many :topics
  has_many :snippets
  validates_length_of :password, { minimum: 6 }

  def unaffiliated_snippets
    self.snippets.select &:unaffiliated?
  end
end
