class Source < ActiveRecord::Base
  belongs_to :user
  has_many :snippets
  validates :url, presence: true, uniqueness: { scope: :user_id }
end