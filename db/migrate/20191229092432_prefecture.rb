class Prefecture < ActiveRecord::Migration[5.2]
  def change
    drop_table :productconditions
    drop_table :deliverydays
    drop_table :deliverycharges
  end
end
