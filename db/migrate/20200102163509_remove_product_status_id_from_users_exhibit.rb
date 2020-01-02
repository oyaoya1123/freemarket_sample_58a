class RemoveProductStatusIdFromUsersExhibit < ActiveRecord::Migration[5.2]
  def change
    remove_column :users_exhibits, :product_status_id, :bigint
  end
end
