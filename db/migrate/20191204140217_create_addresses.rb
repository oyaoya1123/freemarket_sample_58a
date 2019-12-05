class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
