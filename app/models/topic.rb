class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :snippets
  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
  before_destroy :preserve_snippets

  private

  def preserve_snippets
    self.snippets.each do |snippet|
      snippet.unlink!
    end
  end
end