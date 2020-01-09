class RemoveCardNumberFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_number, :integer
  end
end
