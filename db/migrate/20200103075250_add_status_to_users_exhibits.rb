class AddStatusToUsersExhibits < ActiveRecord::Migration[5.2]
  def change
    add_reference :users_exhibits, :product_status, foreign_key: true
  end
end
