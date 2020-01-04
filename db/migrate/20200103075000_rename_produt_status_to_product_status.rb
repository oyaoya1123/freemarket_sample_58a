class RenameProdutStatusToProductStatus < ActiveRecord::Migration[5.2]
  def change
    rename_table :produt_statuses, :product_statuses
  end
end
