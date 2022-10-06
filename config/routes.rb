Rails.application.routes.draw do
  resources :photos
  resources :subscriptions
  resources :comments
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/users', to: 'static_pages#users'

  root to: 'events#index'

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]

    post :show, on: :member
  end

  resources :users, only: %i[show edit update]
end
