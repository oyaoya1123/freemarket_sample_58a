class UsersExhibit < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :produt_status
end
