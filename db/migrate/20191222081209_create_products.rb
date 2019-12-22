class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name,null: false
      t.string  :description,null: false
      t.integer :price,null: false
      t.integer :category_id,null: false, foreign_key: true
      t.integer :subcategory_id,null: false, foreign_key: true
      t.integer :subsubcategory_id,null: false, foreign_key: true
      t.integer :product_condition_id,null: false, foreign_key: true
      t.integer :shipping_charge_id,null: false, foreign_key: true
      t.integer :shipping_origin_id,null: false, foreign_key: true
      t.integer :shipping_day_id,null: false, foreign_key: true
      t.timestamps
    end
  end
end
