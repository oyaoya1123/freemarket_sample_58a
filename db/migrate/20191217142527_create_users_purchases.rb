class CreateUsersPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :users_purchases do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
