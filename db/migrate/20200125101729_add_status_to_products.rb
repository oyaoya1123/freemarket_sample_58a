class AddStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ex_status, :integer
  end
end
