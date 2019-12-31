class Product < ApplicationRecord
  has_one :users_exhibit, dependent: :destroy
  has_one :users_purchase, dependent: :destroy
  has_one :ex_user, through: :users_exhibit, source: :user
  has_one :pu_user, through: :users_purchase, source: :user

  
end
