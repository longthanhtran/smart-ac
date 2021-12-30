Rails.application.routes.draw do

  get 'users', to: "users#index"
  patch 'users', to: "users#update"
  get 'users/show/:id', to: "users#show"

  get 'sign_up', to: "registration#new"
  post 'sign_up', to: "registration#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :acs

  namespace :api do
    resources :acs
    resources :ac_statuses
  end

  # Defines the root path route ("/")
  get 'password', to: "passwords#edit", as: :edit_password
  patch 'password', to: "passwords#update"

  get 'password/reset', to: "password_resets#new"
  post 'password/reset', to: "password_resets#create"

  get 'password/reset/edit', to: "password_resets#edit"
  patch 'password/reset/edit', to: "password_resets#update"

  get 'sign_in', to: "sessions#new"
  post 'sign_in', to: "sessions#create"

  delete 'logout', to: 'sessions#destroy'

  get 'about', to: "main#about"
  root "main#index"
end
