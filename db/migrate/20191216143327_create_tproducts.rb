class CreateTproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tproducts do |t|
      t.string :name

      t.timestamps
    end
  end
end
