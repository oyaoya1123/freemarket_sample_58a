Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'products#index'
  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get 'users/logout' => 'users#logout'
  get 'users/card' => 'users#card'
  get 'users/card_create' => 'users#card_create'
  get 'users/mypage'  => 'users#mypage'
  get 'products/:id/edit_select'  => 'products#edit_select'

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

  resources :users, only:[:show] do
  end


  get 'users/login'  => 'users#login'
  get 'users/signup_page'  => 'users#signup_page'

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do  
    get '/buy'  => 'products#buy'
    get '/pay_finish' => 'products#pay_finish'
    get '/purchase' => 'products#purchase'
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

  end
  
  #購入
  resources :users_purchases, only: [:create] 
  
  #クレジットカード登録
  resources :card, only: [:new] do
    collection do
      post 'pay', to: 'card#pay_create'
    end
  end

end
