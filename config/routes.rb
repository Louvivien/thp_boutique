Rails.application.routes.draw do
  
  post '/index', to: 'kitty#create'
  get '/about', to: 'kitty#about'
  get '/contact', to: 'kitty#contact'
  get '/index', to: 'kitty#new'
  get '/panier', to:'kitty#panier'
  post '/panier', to: 'kitty#order'
  delete '/panier', to: 'kitty#items'

  devise_for :users, controllers: { registrations: "users/registrations" }


  resources :charges
  root 'kitty#index'
  post '/kitty/:id', to: 'kitty#product'
  post '/kitty/new' , to: 'kitty#create'
  resources :kitty


end
