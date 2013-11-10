class Snippet < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :content, :topic_id
  validates :content, length: {maximum: 255}
end