Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks

    resources :photos
    resources :subscriptions
    resources :comments

    get '/users', to: 'static_pages#users'

    root to: 'events#index'

    resources :events do
      resources :comments, only: %i[create destroy]
      resources :subscriptions,
                only: %i[create destroy]
      resources :photos, only: %i[create destroy]

      post :show, on: :member
    end

    resources :users, only: %i[show edit update]
  end
end
