class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name_kanji, :string, null: false
    add_column :users, :first_name_kanji, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthdate_year, :integer, null: false
    add_column :users, :birthdate_month, :integer, null: false
    add_column :users, :birthdate_day, :integer, null: false
    add_column :users, :phone_number, :integer, null: false, unique: true
  end
end
