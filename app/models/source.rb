class Source < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true, uniqueness: { scope: :user_id }
end