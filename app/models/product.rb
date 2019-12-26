class Product < ApplicationRecord
  has_one :users_exhibit, dependent: :destroy
  has_one :users_purchase, dependent: :destroy
  has_one :ex_user, through: :users_exhibit, source: :user
  has_one :pu_user, through: :users_purchase, source: :user
  # mount_uploader :image_url, ImageUploader
  has_many :product_images
  accepts_nested_attributes_for :product_images
end
