class AddCategoryRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, :bigint, foreign_key: true
  end
end
