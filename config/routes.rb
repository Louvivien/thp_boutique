Rails.application.routes.draw do


  devise_for :users
  resources :charges
  root 'kitty#index'
  post '/kitty/new' , to: 'kitty#create'
  resources :kitty

end
