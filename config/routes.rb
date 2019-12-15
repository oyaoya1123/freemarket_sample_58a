Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/edit' => 'users#edit'
  get 'users/identification' => 'users#identification'
  get 'products/index'  => 'products#index'
  get 'products/buy'  => 'products#buy'
  get 'products/create'  => 'products#create'
  get 'users/logout' => 'users#logout'
  get 'products/itemshow'  => 'products#itemshow'
  get 'users/mypage'  => 'users#mypage'
  get 'users/signupsmscon' => 'users#signupsmscon'
  get 'users/signupregistration' => 'users#signupregistration'
  get 'users/new_create'  => 'users#new_create'
  get 'users/login'  => 'users#login'
  get 'users/signup_page'  => 'users#signup_page'
  get 'users/signup_adress_input'  => 'users#signup_adress_input'
  get 'users/complete'  => 'users#complete'
  
end
