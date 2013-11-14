class AddSourceRefToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :source_id, :integer
  end
end
