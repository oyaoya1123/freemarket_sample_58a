class CreateDeliverycharges < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverycharges do |t|
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
