class AddStatusToUsersPurchases < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_purchases, :product_status, foreign_key: true
  end
end
