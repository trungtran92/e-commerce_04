Rails.application.routes.draw do
  get 'sessions/new'

  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  resources :users

  get "/static_pages/*page", to: "static_pages#show"
end
