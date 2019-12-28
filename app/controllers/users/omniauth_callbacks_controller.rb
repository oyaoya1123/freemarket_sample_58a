# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    #@user = User.from_omniauth(request.env["omniauth.auth"])
    #binding.pry
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      #session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      #redirect_to new_user_registration_url
      #redirect_to products_url
      session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる(少し難)
      #render template: "devise/registrations/new" #redirect_to だと更新してしまうのでrenderで
      #render template: "users/signupregistration"
      session[:password] = ""
      session[:email] = ""
      session[:password_confirmation] = ""
      binding.pry
      redirect_to controller: 'users', action: 'signupregistration'
    end
  end

  def failure
    redirect_to root_path
  end

end
