class Category < ApplicationRecord
  has_ancestry
  scope :cat1, -> { where(ancestry: 1)}
  scope :cat2, -> { where(ancestry: 199)}
  scope :cat3, -> { where(ancestry: 345)}
  scope :cat4, -> { where(ancestry: 480)}
  scope :cat5, -> { where(ancestry: 622)}
  scope :cat6, -> { where(ancestry: 681)}
  scope :cat7, -> { where(ancestry: 794)}
  scope :cat8, -> { where(ancestry: 894)}
  scope :cat9, -> { where(ancestry: 980)}
  scope :cat10, -> { where(ancestry: 1089)}
  scope :cat11, -> { where(ancestry: 1141)}
  scope :cat12, -> { where(ancestry: 1201)}
  scope :cat13, -> { where(ancestry: 1264)}







end
