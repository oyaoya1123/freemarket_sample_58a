class DropTableDeliveryCharges < ActiveRecord::Migration[5.2]
  def change
    drop_table :delivery_charges
  end
end
