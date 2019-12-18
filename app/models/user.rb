class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_exhibits, dependent: :destroy
  has_many :users_purchases, dependent: :destroy
  has_many :ex_products, through: :users_exhibits, source: :product, dependent: :destroy
  has_many :pu_products, through: :users_purchases, source: :product, dependent: :destroy
end
