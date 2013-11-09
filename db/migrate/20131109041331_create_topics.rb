class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :topics
  end
end
