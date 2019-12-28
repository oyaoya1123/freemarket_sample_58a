class ChangeDatatypeUserIdOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :user_id, :bigint
  end
end
