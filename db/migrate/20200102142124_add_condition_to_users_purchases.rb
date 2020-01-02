class AddConditionToUsersPurchases < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_purchases, :product_conditions, foreign_key: true
  end
end
