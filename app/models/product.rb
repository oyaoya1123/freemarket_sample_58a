class Product < ApplicationRecord
  has_one :users_exhibit, dependent: :destroy
  has_one :users_purchase, dependent: :destroy
  has_one :ex_user, through: :users_exhibit, source: :user
  has_one :pu_user, through: :users_purchase, source: :user

  has_many :product_images
  accepts_nested_attributes_for :product_images

  has_many :categories
  has_many :product_images

end
