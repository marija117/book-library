Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "authors#index"
  
  devise_for :users

  resources :authors do
    resources :books
  end
end
