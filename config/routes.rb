Rails.application.routes.draw do
  devise_for :users

  # get '/users', to: 'static_pages#users'

  root to: 'events#index'

  resources :events
  resources :users, only: %i[show edit update]
end
