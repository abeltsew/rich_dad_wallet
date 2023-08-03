Rails.application.routes.draw do
  devise_for :users

  # Protect all routes with a login
  authenticated :user do
    resources :balances, only: %i[index show new create] do
      resources :items, only: %i[new create]
    end
  end

  root 'balances#index'

  get '/home', to: 'home#index'
end
