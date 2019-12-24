Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/edit' => 'users#edit'
  get 'users/identification' => 'users#identification'
  get 'products/index'  => 'products#index'
  get 'products/buy'  => 'products#buy'
  get 'products/create'  => 'products#create'
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/card_create' => 'users#card_create'
  get 'products/itemshow'  => 'products#itemshow'
  get 'users/mypage'  => 'users#mypage'

  get 'users/signup'  => 'users#new_create'
  get 'users/signup/registration' => 'users#signupregistration'
  post 'users/signup/smscon' => 'users#signupsmscon'
  post 'users/signup/adress_input'  => 'users#signup_adress_input'
  post 'users/signup/card'  => 'users#signup_card'
  post 'users/signup/create'  => 'users#create'
  get 'users/signup/complete'  => 'users#complete'

  get 'users/login'  => 'users#login'
  get 'users/signup_page'  => 'users#signup_page'
  
end
