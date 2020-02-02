class ProductStatus < ApplicationRecord
  has_many :users_exhibits
  has_many :users_purchases
end
