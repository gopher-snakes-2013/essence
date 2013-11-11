class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :content
      t.belongs_to :topic
      t.has_one :user, through: :topics
      t.timestamps
    end
  end
end
