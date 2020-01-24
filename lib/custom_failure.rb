class CustomFailure < Devise::FailureApp
  def redirect_url
    users_login_url
  end
 end