Rails.application.routes.draw do
  get "sessions/new"

  root "static_pages#home"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users
  resources :products
  resources :cart
  resources :category
  resources :suggests

  get "/static_pages/*page", to: "static_pages#show"

  namespace :admin do
    resources :categories
    resources :users, only: [:index, :destroy]
    resources :products
    resources :suggests
  end
end
