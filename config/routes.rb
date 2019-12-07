Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'githubtests' => 'githubtests#index'
  get 'githubtests/mypage' => 'githubtests#mypage'
  get 'users/edit' => 'users#edit'
  get 'users/identification' => 'users#identification'
  get 'products/index'  => 'products#index'
  get 'products/buy'  => 'products#buy'
  get 'users/logout' => 'users#logout'
end
