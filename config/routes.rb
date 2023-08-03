Rails.application.routes.draw do
  devise_for :users

  # Protect all routes with a login
  authenticated :user do
    resources :balances, only: %i[index show new create]
  end

  authenticated :user do
    resources :items, only: %i[index show new create]
  end

  root 'balances#index'

  get '/home', to: 'home#index'
end
