class CreateShippingCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_charges do |t|
      t.string  :name,null: false, unique: true
      t.timestamps
    end
  end
end
