class Tproduct < ApplicationRecord
  has_one :tusers_exhibit, dependent: :destroy
  has_one :tusers_purchase, dependent: :destroy
  has_one :ex_tuser, through: :tusers_exhibit, source: :tuser, dependent: :destroy
  has_one :pu_tuser, through: :tusers_purchase, source: :tuser, dependent: :destroy
end
