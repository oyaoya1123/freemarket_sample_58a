class AddMessageToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :message, :string
  end
end
