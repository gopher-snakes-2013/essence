class Snippet < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :content
end