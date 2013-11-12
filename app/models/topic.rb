class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :snippets
  validates_presence_of :name, :user_id
  validates_uniqueness_of :name, scope: :user_id
  before_destroy :preserve_snippets

  private

  def preserve_snippets
    self.snippets.each do |snippet|
      snippet.unlink!
    end
  end
end