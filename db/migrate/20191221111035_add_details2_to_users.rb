class AddDetails2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_last_name, :string, null: false
    add_column :users, :address_first_name, :string, null: false
    add_column :users, :address_last_name_kana, :string, null: false
    add_column :users, :address_first_name_kana, :string, null: false
    add_column :users, :prefecture, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :address1, :string, null: false
    add_column :users, :address2, :string
    add_column :users, :address_phone_number, :string
  end
end
