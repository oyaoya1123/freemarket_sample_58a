class AddSizeCategoryToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :size_category, :integer
  end
end
