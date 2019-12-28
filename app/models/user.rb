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

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # sns認証
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    binding.pry

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認 
          # nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token[0,20],
          password_confirmation: Devise.friendly_token[0,20]
        )
      end
      sns = snscredential
      binding.pry
    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
        binding.pry
      else #会員登録 未
        user = User.new(
          #nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token[0,20],
          password_confirmation: Devise.friendly_token[0,20]
        )
        binding.pry
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
        binding.pry 
      end
    end
    binding.pry
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
  end

end
