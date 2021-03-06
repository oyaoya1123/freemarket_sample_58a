class UsersController < ApplicationController

  before_action :validates_registration, only: :signupsmscon # registrationのバリデーション
  before_action :validates_smscon, only: :signup_adress_input # signupsmsconのバリデーション
  before_action :validates_adress_input, only: :signup_create # signup_adress_inputのバリデーション
  include CommonActions
  before_action :set_categories
  before_action :result, only: [:show, :profile, :mypage_product_list, :identification, :card, :card_create, :logout, :mypage_purchase_product]
  before_action :set_card, only: [:card]

  before_action :authenticate_user!, only: [:show, :profile, :identification]
  before_action :set_purchase_product, only: [:show,:mypage_purchase_product]
  before_action :set_exhibits_product, only: [:show,:mypage_product_list]
  before_action :user_login, only: [:show,:mypage_product_list] # エラー回避

  def show
  end

  def mypage_purchase_product

  end
  
  def profile
  end

  def identification
  end

  def signup
  end

  def signupregistration
    @user = User.new
    @sns_id = session[:sns_id]
    @email = session[:email]
    @password = session[:password]
  end

  def signupsmscon
    @user = User.new
  end

  def validates_registration

    session[:nickname] = user_params[:nickname]

    unless session[:sns_id].present?
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
    end

    session[:last_name_kanji] = user_params[:last_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: "09012345678",
    )
    render action: :signupregistration unless @user.valid?
  end

  def validates_smscon
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
    )
    render action: :signupsmscon unless @user.valid?
  end

  def validates_adress_input
    session[:address_last_name] = address_params[:address_last_name]
    session[:address_first_name] = address_params[:address_first_name]
    session[:address_last_name_kana] = address_params[:address_last_name_kana]
    session[:address_first_name_kana] = address_params[:address_first_name_kana]
    session[:prefectures] = address_params[:prefectures]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
    session[:address_phone_number] = address_params[:address_phone_number]
    session[:postal_code] = address_params[:postal_code]

    @address = Address.new(
      address_last_name: session[:address_last_name],
      address_first_name: session[:address_first_name],
      address_last_name_kana: session[:address_last_name_kana],
      address_first_name_kana: session[:address_first_name_kana],
      prefectures: session[:prefectures],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      address_phone_number: session[:address_phone_number],
      postal_code: session[:postal_code],
      user_id: 1
    )
    render action: :signup_adress_input unless @address.valid?
  end

  def signup_adress_input
    @user = User.new
    @address = Address.new
  end

  def signup_card
    @user = User.new
    @address = Adress.new
  end
  
  def complete
  end

  def mypage
  end

  def mypage_product_list
    @user = User.find(current_user.id)
    @user_products = @user.ex_products
    @stasus_name = ProductStatus.find(1)
  end

  def login
  end
 
  def signup_page
  end

  def signup_create

    session[:sns_id] = nil

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name_kanji: session[:last_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number],
    )
    if @user.save
      session[:id] = @user.id
      @address = Address.new(
        address_last_name: session[:address_last_name],
        address_first_name: session[:address_first_name],
        address_last_name_kana: session[:address_last_name_kana],
        address_first_name_kana: session[:address_first_name_kana],
        prefectures: session[:prefectures],
        city: session[:city],
        house_number: session[:house_number],
        building_name: session[:building_name],
        address_phone_number: session[:address_phone_number],
        postal_code: session[:postal_code],
        user_id: session[:id]
      )
      if @address.save
        sns = SnsCredential.update(user_id: session[:id])
        sign_in User.find(session[:id]) unless user_signed_in?
        redirect_to controller: 'card', action: 'new'
      else
        User.find(session[:id]).destroy
        render action: :signup_adress_input
      end
    else
      #支払い登録ページから戻るを選択した時は支払い登録に遷移できるようにする
      binding.pry
      if User.find(session[:id])
        redirect_to controller: 'card', action: 'new'
      else
        render action: :signup_adress_input
      end
    end
  end

  def card
    
    if @card
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end

  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name_kanji,
      :first_name_kanji,
      :last_name_kana,
      :first_name_kana,
      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
      :phone_number,
    )
  end

  def address_params
    params.require(:address).permit(
      :address_last_name,
      :address_first_name,
      :address_last_name_kana,
      :address_first_name_kana,
      :prefectures,
      :city,
      :house_number,
      :building_name,
      :address_phone_number,
      :postal_code
    )
  end

  def user_login
    unless user_signed_in?
      redirect_to users_login_path
    end
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_purchase_product
    @user=User.find(current_user.id)
    @pu_products=@user.pu_products
    @pu_ad_product_ids = UsersPurchase.where(product_status_id:2).where(user_id: current_user.id)
    @user_ad_pu_products=[]
    @pu_ad_product_ids.each do |id|
      p=Product.find(id.product_id)
      @user_ad_pu_products<<p
    end
    @pu_fin_product_ids = UsersPurchase.where(product_status_id:4).where(user_id: current_user.id)
    @user_fin_pu_products=[]
    @pu_fin_product_ids.each do |id|
      p=Product.find(id.product_id)
      @user_fin_pu_products<<p
    end
  end

  def set_exhibits_product
    @ex_ad_product_ids = UsersExhibit.where(product_status_id:2).where(user_id: current_user.id)
    @user_ad_ex_products=[]
    @ex_ad_product_ids.each do |id|
      p=Product.find(id.product_id)
      @user_ad_ex_products<<p
    end
    @ex_fin_product_ids = UsersExhibit.where(product_status_id:3).where(user_id: current_user.id)
    @user_fin_ex_products=[]
    @ex_fin_product_ids.each do |id|
      p=Product.find(id.product_id)
      @user_fin_ex_products<<p
    end
  end

end