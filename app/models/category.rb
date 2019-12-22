class Category < ApplicationRecord
  has_ancestry

  scope :cat, -> (a) {where(ancestry: nil).order(id: :ASC).offset(a)}
end
