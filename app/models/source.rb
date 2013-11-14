class Source < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true, uniqueness: { scope: :user_id }
  validates :title, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end