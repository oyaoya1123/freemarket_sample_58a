class AddNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address_last_name, :string,null: false
    add_column :addresses, :address_first_name, :string,null: false
    add_column :addresses, :address_last_name_kana, :string,null: false
    add_column :addresses, :address_first_name_kana, :string,null: false
    add_column :addresses, :address_phone_number, :string
  end
end
