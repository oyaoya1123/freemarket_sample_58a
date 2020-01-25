class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :rate, foreign_key: { to_table: :users }, null: false
      t.integer :rate, null: false
      t.references :rater, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
