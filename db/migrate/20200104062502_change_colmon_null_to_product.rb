class ChangeColmonNullToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :shipping_origin, false, 0
    change_column_null :products, :shipping_method, false, 0
    change_column_null :products, :shipping_charge, false, 0
    change_column_null :products, :shipping_day, false, 0
    change_column_null :products, :product_condition, false, 0
    change_column_null :products, :category_id, false, 0
  end
end
