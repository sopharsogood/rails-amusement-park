Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/attraction/:id/ride', to: 'rides#new', as: 'attraction_ride'
end
