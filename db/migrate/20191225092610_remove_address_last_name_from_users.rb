class RemoveAddressLastNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address_last_name, :string
    remove_column :users, :address_first_name, :string
    remove_column :users, :address_last_name_kana, :string
    remove_column :users, :address_first_name_kana, :string
    remove_column :users, :prefecture, :string
    remove_column :users, :city, :string
    remove_column :users, :address1, :string
    remove_column :users, :address2, :string
    remove_column :users, :address_phone_number, :string
    remove_column :users, :zip_code, :string
  end
end
