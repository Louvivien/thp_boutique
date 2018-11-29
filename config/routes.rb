Rails.application.routes.draw do
  
  post '/index', to: 'kitty#create'
  get '/about', to: 'kitty#about'
  get '/contact', to: 'kitty#contact'
  get '/index', to: 'kitty#new'
  get '/panier', to:'kitty#panier'
  get '/conf', to: 'kitty#conf'
  post '/conf', to: 'kitty#backpanier'
  post '/panier', to: 'kitty#order'
  delete '/panier', to: 'kitty#items'
  devise_for :users
  resources :charges
  root 'kitty#index'
  post '/kitty/:id', to: 'kitty#product'
  post '/kitty/new' , to: 'kitty#create'
  resources :kitty


end
