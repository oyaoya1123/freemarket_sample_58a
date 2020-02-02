class Brand < ApplicationRecord
  has_many :brands_catergories
  has_many :categories, through: :brands_catergories
end
