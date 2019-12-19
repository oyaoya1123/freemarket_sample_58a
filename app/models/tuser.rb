class Tuser < ApplicationRecord
  has_many :tusers_exhibits, dependent: :destroy
  has_many :tusers_purchases, dependent: :destroy
  has_many :ex_tproducts, through: :tusers_exhibits, source: :tproduct, dependent: :destroy
  has_many :pu_tproducts, through: :tusers_purchases, source: :tproduct, dependent: :destroy
end