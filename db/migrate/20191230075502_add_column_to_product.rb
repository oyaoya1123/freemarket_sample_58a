class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_condition, :string
  end
end
