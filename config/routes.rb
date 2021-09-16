Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'
end
