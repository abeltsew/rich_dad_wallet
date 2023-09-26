Rails.application.routes.draw do
  devise_for :users

  resources :balances, only: %i[index show new create] do
    resources :items, only: %i[new create]
  end

  root 'balances#index'

  get '/home', to: 'home#index'
end
