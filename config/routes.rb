Rails.application.routes.draw do
  
  post '/index', to: 'kitty#create'
  get '/index', to: 'kitty#new'
  devise_for :users
  resources :charges
  root 'kitty#index'
  post '/kitty/new' , to: 'kitty#create'
  resources :kitty

end
