class AddSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.belongs_to :user
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
