Rails.application.routes.draw do
  namespace :admin do
  get "dashboard", to: "dashboard#index"
  end
  resources :progresses
  resources :assignments
  resources :courses
  resources :students
  get 'dashboard/index'
  root "home#index"

  resources :users, only: [:new, :create, :show]

  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/guest_login", to: "sessions#guest_login"
  post "/admin_guest_login", to: "sessions#admin_guest_login"

  get "/profile", to: "users#show"
  get "/dashboard", to: "dashboard#index"
end