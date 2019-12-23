class RemoveProductIdFromProductImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_images, :product_id, :int
    add_reference :product_images, :product, null: false, foreign_key: true
  end
end
