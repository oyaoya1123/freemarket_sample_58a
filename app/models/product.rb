class Product < ApplicationRecord
  has_one :users_exhibit, dependent: :destroy
  has_one :users_purchase, dependent: :destroy
  has_one :ex_user, through: :users_exhibit, source: :user
  has_one :pu_user, through: :users_purchase, source: :user

  has_many :product_images, dependent: :destroy

  accepts_nested_attributes_for :product_images, allow_destroy: true

  # belongs_to :ex_status, class_name: 'ProductStatus'

  validates :product_images,presence: { message: 'を選択してください。' }, length: { minimum: 1, maximum: 10 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: { message: 'を選択してください。' }
  validates :price, presence: { message: 'を入力してください。' }, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999
  }

  validates :shipping_origin, presence: { message: 'を選択してください。' }
  validates :shipping_method, presence: { message: 'を選択してください。' }
  validates :shipping_charge, presence: { message: 'を選択してください。' }
  validates :shipping_day, presence: { message: 'を選択してください。' }
  validates :product_condition, presence: { message: 'を選択してください。' }
  # validates :size, presence: true

  belongs_to :category

end
