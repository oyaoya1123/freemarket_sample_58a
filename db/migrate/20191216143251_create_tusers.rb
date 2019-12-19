class CreateTusers < ActiveRecord::Migration[5.2]
  def change
    create_table :tusers do |t|
      t.string :name

      t.timestamps
    end
  end
end
