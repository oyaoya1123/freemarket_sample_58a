Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'githubtests' => 'githubtests#index'
  # get 'githubtests/mypage' => 'githubtests#mypage'
  # get 'githubtests/logout' => 'githubtests#logout'


  get 'users/logout' => 'users#logout'
  get 'users/mypage' => 'users#mypage'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get 'users/card' => 'users#card'
  get 'users/card_create' => 'users#card_create'
  get 'products/index' => 'products#index'
  get 'products/itemshow' => 'products#itemshow' #仮
  get 'products/create' => 'products#create'
  get 'products/buy' => 'products#buy'

end
