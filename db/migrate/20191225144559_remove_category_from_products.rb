class RemoveCategoryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category_id, :int
    remove_column :products, :subcategory_id, :int
    remove_column :products, :subsubcategory_id, :int
    remove_column :products, :product_condition_id, :int
    remove_column :products, :shipping_charge_id, :int
    remove_column :products, :shipping_origin_id, :int
    remove_column :products, :shipping_day_id, :int
  end
end
