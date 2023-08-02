Rails.application.routes.draw do
  devise_for :users
  
  # Protect all routes with a login
  # authenticated :user do
  #   resources :articles
  # end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
end
