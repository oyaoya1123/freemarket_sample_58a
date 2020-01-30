class ProductStatus < ApplicationRecord
  has_many :users_exhibits
  has_many :users_purchases
  # has_many :products
end
