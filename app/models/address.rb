class Address < ApplicationRecord

  belongs_to :user

  validates :address_last_name, presence: true
  validates :address_first_name, presence: true
  validates :address_last_name_kana, presence: true
  validates :address_first_name_kana, presence: true
  validates :prefectures, presence: true
  validates :prefectures, exclusion: { in: %w(---) }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :postal_code, presence: true

end
