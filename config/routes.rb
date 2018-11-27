Rails.application.routes.draw do


  resources :charges
  root 'index#index'
  resources :index
  resources :show

end
