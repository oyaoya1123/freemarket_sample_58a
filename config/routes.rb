Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :users, only: [:show, :create, :edit, :update] do
    get '/new_create'  => 'users#new_create'
    get '/signup_page'  => 'users#signup_page'
    get '/signupregistration' => 'users#signupregistration'
    get '/signupsmscon' => 'users#signupsmscon'
    get '/signup_adress_input'  => 'users#signup_adress_input'
    get '/card' => 'users#card'
    get '/identification' => 'users#identification'
    get '/card_create' => 'users#card_create'
    get '/signup_card'  => 'users#signup_card'
    get '/login'  => 'users#login'
    get '/logout' => 'users#logout'
    get '/complete'  => 'users#complete'
    
  end
  
  #出品
  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    get '/buy'  => 'products#buy' 
  end
  #購入
  resources :users_purchases, only: [:create] 


  
  # get 'githubtests' => 'githubtests#index'
  # get 'githubtests/mypage' => 'githubtests#mypage'
  # get 'users/edit' => 'users#edit'
  # get 'users/identification' => 'users#identification'
  # get 'products/index'  => 'products#index'
  # get 'products/buy'  => 'products#buy'
  # get 'products/create'  => 'products#create'
  # get 'users/logout' => 'users#logout'
  # get 'users/card' => 'users#card'
  # get 'users/card_create' => 'users#card_create'
  # get 'products/itemshow'  => 'products#itemshow'
  # get 'users/mypage'  => 'users#mypage'
  # get 'users/signupsmscon' => 'users#signupsmscon'
  # get 'users/signupregistration' => 'users#signupregistration'
  # get 'users/new_create'  => 'users#new_create'
  # get 'users/login'  => 'users#login'
  # get 'users/signup_page'  => 'users#signup_page'
  # get 'users/signup_adress_input'  => 'users#signup_adress_input'
  # get 'users/signup_card'  => 'users#signup_card'

  # get 'users/complete'  => 'users#complete'
  
end
