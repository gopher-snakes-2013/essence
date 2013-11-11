class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :snippets
  validates_presence_of :name, :user_id
  validates_uniqueness_of :name, scope: :user_id
end