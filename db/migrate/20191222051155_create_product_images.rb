class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :image_url, null: false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
