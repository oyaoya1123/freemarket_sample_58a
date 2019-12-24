class UsersController < ApplicationController

  before_action :validates_registration, only: :signupsmscon # registrationのバリデーション
  before_action :validates_smscon, only: :signup_adress_input # signupsmsconのバリデーション
  before_action :validates_adress_input, only: :signup_card # signup_adress_inputのバリデーション
  
  def edit
  end

  def identification
  end

  def new_create
  end

  def signupregistration
    @user = User.new
  end

  def signupsmscon
    @user = User.new
  end

  def validates_registration
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
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
      address_last_name: "大矢",
      address_first_name: "和輝",
      address_last_name_kana: "オオヤ",
      address_first_name_kana: "カズキ",
      prefecture: "北海道",
      city: "大阪府",
      address1: "1-1-1",
      address2: "大阪市",
      address_phone_number: "09012345678",
      zip_code: "123-4567"
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
      address_last_name: "大矢",
      address_first_name: "和輝",
      address_last_name_kana: "オオヤ",
      address_first_name_kana: "カズキ",
      prefecture: "北海道",
      city: "大阪府",
      address1: "1-1-1",
      address2: "大阪市",
      address_phone_number: "09012345678",
      zip_code: "123-4567"
    )
    render action: :signupsmscon unless @user.valid?
  end

  def validates_adress_input
    session[:address_last_name] = user_params[:address_last_name]
    session[:address_first_name] = user_params[:address_first_name]
    session[:address_last_name_kana] = user_params[:address_last_name_kana]
    session[:address_first_name_kana] = user_params[:address_first_name_kana]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address1] = user_params[:address1]
    session[:address2] = user_params[:address2]
    session[:address_phone_number] = user_params[:address_phone_number]
    session[:zip_code] = user_params[:zip_code]

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
      address_last_name: session[:address_last_name],
      address_first_name: session[:address_first_name],
      address_last_name_kana: session[:address_last_name_kana],
      address_first_name_kana: session[:address_first_name_kana],
      prefecture: session[:prefecture],
      city: session[:city],
      address1: session[:address1] ,
      address2: session[:address2],
      address_phone_number: session[:address_phone_number],
      zip_code: session[:zip_code]
    )
    render action: :signup_adress_input unless @user.valid?
  end

  def signup_adress_input
    @user = User.new
  end

  def signup_card
    @user = User.new
  end
  
  def complete
  end

  def mypage
  end

  def login
  end
 
  def signup_page
  end

  def create
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
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      address_last_name_kana: user_params[:address_last_name_kana],
      address_first_name_kana: user_params[:address_first_name_kana],
      prefecture: user_params[:prefecture],
      city: user_params[:city],
      address1: user_params[:address1],
      address2: user_params[:address2],
      address_phone_number: user_params[:address_phone_number],
      zip_code: user_params[:zip_code]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to users_signup_complete_path
    else
      render action: :signup_adress_input
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
      :address_last_name,
      :address_first_name,
      :address_last_name_kana,
      :address_first_name_kana,
      :prefecture,
      :city,
      :address1,
      :address2,
      :address_phone_number,
      :zip_code
    )
  end
end