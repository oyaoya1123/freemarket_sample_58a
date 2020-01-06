class UsersExhibit < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :product_status
end
