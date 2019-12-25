class CreateDeliverydays < ActiveRecord::Migration[5.2]
  def change
    create_table :deliverydays do |t|
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
