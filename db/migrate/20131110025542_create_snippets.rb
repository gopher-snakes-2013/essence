class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :content
      t.belongs_to :topic
      t.belongs_to :user
      t.timestamps
    end
  end
end
