class Rate < ApplicationRecord
  belongs_to :rate, class_name: 'User',:foreign_key => 'rate_id'
  belongs_to :rater,  class_name: 'User' ,:foreign_key => 'rate_id'
  has_many :products
end
