Rails.application.routes.draw do
  devise_for :users
  
  # Protect all routes with a login
  authenticated :user do
    resources :balances, only: %i[index new create]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "balance#index"
   get "/home", to: "home#index"

end
