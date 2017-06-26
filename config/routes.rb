Rails.application.routes.draw do
  get "sessions/new"

  root "static_pages#home"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users
  resources :products
  resources :carts
  resources :category
  resources :suggests

  get "/static_pages/*page", to: "static_pages#show"

  namespace :admin do
    resources :categories
    resources :users, only: [:index, :destroy]
    resources :products do
      collection {post :import}
    end
    resources :suggests
  end
end
