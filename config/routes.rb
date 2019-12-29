Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'products#index'
  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  # get 'products/index'  => 'products#index'
  # get 'products/buy'  => 'products#buy'
  # get 'products/create'  => 'products#create'
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/card_create' => 'users#card_create'
  # get 'products/itemshow'  => 'products#itemshow'
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

  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    get '/buy'  => 'products#buy' 
  end
  
  #購入
  resources :users_purchases, only: [:create] 
  
end
