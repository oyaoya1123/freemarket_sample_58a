class CreateShippingDays < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_days do |t|
      t.string    :name,null: false, unique: true
      t.timestamps
    end
  end
end
