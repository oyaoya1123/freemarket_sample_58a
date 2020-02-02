class Category < ApplicationRecord
  has_ancestry
  has_many :products
  has_many :brands_categories
  has_many :brands, through: :brands_categories

end
