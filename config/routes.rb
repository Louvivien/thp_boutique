Rails.application.routes.draw do


  devise_for :users
  resources :charges
  root 'index#index'
  resources :index
  resources :show

end
