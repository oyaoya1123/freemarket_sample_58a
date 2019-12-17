class UsersController < ApplicationController
  
  def edit
  end

  def identification  
  end

  def signupsmscon
  end
  
  def signupregistration
  end
  
  def new_create
  end

  def mypage
  end

  def login
  end
 
  def signup_page
    @user = Tuser.find(1)
    @product = Tproduct.find(1)
  end

  def signup_adress_input 
  end
  
  def complete
  end

end
