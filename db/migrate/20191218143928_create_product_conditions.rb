class CreateProductConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_conditions do |t|
      t.string   :name,null: false, unique: true
      t.timestamps
    end
  end
end
