class AddColumnCategoryToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category_id, :integer, foreign_key: true
  end
end
