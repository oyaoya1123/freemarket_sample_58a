class AddNicknameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category_id, :integer ,null: false, foreign_key: true
    add_column :products, :subcategory_id, :integer,null: false, foreign_key: true
    add_column :products, :subsubcategory_id, :integer,null: false, foreign_key: true
    add_column :products, :product_condition_id, :integer,null: false, foreign_key: true
    add_column :products, :shipping_charge_id, :integer,null: false, foreign_key: true
    add_column :products, :shipping_origin_id, :integer,null: false, foreign_key: true
    add_column :products, :shipping_day_id, :integer,null: false, foreign_key: true
  end
end
