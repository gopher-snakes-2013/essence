class Source < ActiveRecord::Base
  belongs_to :user
  has_many :snippets
  validates :url, presence: true
  validates :url, uniqueness: {scope: :user_id}
  validates :title, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end