class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_exhibits, dependent: :destroy
  has_many :users_purchases, dependent: :destroy
  has_many :ex_products, through: :users_exhibits, source: :product, dependent: :destroy
  has_many :pu_products, through: :users_purchases, source: :product, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true, length: {minimum: 7}
  validates :password_confirmation, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthdate_year, numericality: true
  validates :birthdate_month, numericality: true
  validates :birthdate_day, numericality: true
  validates :phone_number, presence: true
  validates :address_last_name, presence: true
  validates :address_first_name, presence: true
  validates :address_last_name_kana, presence: true
  validates :address_first_name_kana, presence: true
  validates :prefecture, presence: true
  validates :prefecture, exclusion: { in: %w(---) }
  validates :city, presence: true
  validates :address1, presence: true
  validates :zip_code, presence: true

end
