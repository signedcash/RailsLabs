Rails.application.routes.draw do
  root 'home#input'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get 'home/input', :as => 'input'
  get 'home/output', :as => 'output'

  get "signup", to: "users#new", as: "signup"

  get "login", to: "sessions#new", as: "login"
  get "auth", to: "sessions#create", as: "auth"
  get "logout", to: "sessions#destroy", as: "logout"
end

