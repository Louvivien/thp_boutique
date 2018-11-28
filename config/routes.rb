Rails.application.routes.draw do


  devise_for :users
  resources :charges
  root 'kitty#index'
  resources :kitty
end
