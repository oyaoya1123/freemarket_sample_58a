class CreateTusersExhibits < ActiveRecord::Migration[5.2]
  def change
    create_table :tusers_exhibits do |t|
      t.integer :tuser_id
      t.integer :tproduct_id

      t.timestamps
    end
  end
end
