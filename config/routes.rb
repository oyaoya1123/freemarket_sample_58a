Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get 'products/index'  => 'products#index'
  get 'products/buy'  => 'products#buy'
  get 'products/create'  => 'products#create'
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/card_create' => 'users#card_create'
  get 'products/itemshow'  => 'products#itemshow'
  get 'users/mypage'  => 'users#mypage'

  resource :users do
    collection do
      get 'signup'
      get 'signupregistration'
      post 'signupsmscon'
      post 'signup_adress_input'
      post 'signup_card'
      post 'signup_create'
      get 'complete'
    end
  end

  get 'users/login'  => 'users#login'
  get 'users/signup_page'  => 'users#signup_page'
  
end
