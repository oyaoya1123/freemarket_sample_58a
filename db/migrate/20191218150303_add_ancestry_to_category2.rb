class AddAncestryToCategory2 < ActiveRecord::Migration[5.2]
  def change
    add_column :category2s, :name, :string
    add_column :category2s, :ancestry, :string
    add_index :category2s, :ancestry
  end
end
