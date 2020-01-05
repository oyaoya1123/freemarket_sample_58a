class ProductImage < ApplicationRecord
  belongs_to :product

  mount_uploader :image_url, ImageUploader

  validates :product, presence: true
  validates :image_url, presence: true

end
