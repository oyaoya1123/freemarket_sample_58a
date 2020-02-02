class CreateBrandsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brands_categories do |t|
      t.integer :brand_id, unique: true
      t.integer :category_id, unique: true

      t.timestamps
    end
  end
end
