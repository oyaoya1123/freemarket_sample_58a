class AddColumnDeliveryToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shipping_origin, :string
    add_column :products, :shipping_method, :string
    add_column :products, :shipping_charge, :string
    add_column :products, :shipping_day, :string
  end
end
