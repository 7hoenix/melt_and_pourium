Rails.application.routes.draw do
  root "items#index"

  get "items", to: "items#index"
  get "items/:id", to: "items#show"

  get "cart", to: "cart_items#index"
  post "cart_items", to: "cart_items#create"

  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
end
