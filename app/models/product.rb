class Product < ApplicationRecord
  has_one :users_exhibit, dependent: :destroy
  has_one :users_purchase, dependent: :destroy
  has_one :ex_user, through: :users_exhibit, source: :user
  has_one :pu_user, through: :users_purchase, source: :user

  has_many :product_images, dependent: :destroy

  accepts_nested_attributes_for :product_images, allow_destroy: true

  # validates :product_images, presence: true
  validates :product_images,presence: true, length: { minimum: 1, maximum: 10 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :price, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999
  }
  validates :shipping_origin, presence: true
  validates :shipping_method, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_day, presence: true
  validates :product_condition, presence: true

  has_many :categories

end
