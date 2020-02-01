class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :users_exhibits, dependent: :destroy
  has_many :users_purchases, dependent: :destroy
  has_many :ex_products, through: :users_exhibits, source: :product, dependent: :destroy
  has_many :pu_products, through: :users_purchases, source: :product, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthdate_year, numericality: true
  validates :birthdate_month, numericality: true
  validates :birthdate_day, numericality: true
  validates :phone_number, presence: true

  # sns認証
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    if snscredential.present? #sns登録済み
      user = User.find_by(id: snscredential.user_id)
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          email: auth.info.email
        )
      end
      sns = snscredential
    else #sns登録 未
      user = User.find_by(email: auth.info.email)
      if user.present? #会員登録 済
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user , sns_id: sns.id }
  end

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end

end
