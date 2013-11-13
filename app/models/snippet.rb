class Snippet < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates_presence_of :content, :user_id
  validates :content, length: {maximum: 255}

  def unlink!
    self.update_attribute :topic, nil
  end

  def unaffiliated?
    self.topic.blank?
  end
end