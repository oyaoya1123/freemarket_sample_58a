class CreateTusersPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :tusers_purchases do |t|
      t.integer :tuser_id
      t.integer :tproduct_id

      t.timestamps
    end
  end
end
