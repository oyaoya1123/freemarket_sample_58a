class CreateProdutStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :produt_statuses do |t|
      t.string    :name,null: false
      t.timestamps
    end
  end
end
