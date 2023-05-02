Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users
  resources :categories_weapons
  resources :categories
  resources :weapons do
    member do
      delete 'destroy_image'
    end
  end

  resources :order_lines
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
