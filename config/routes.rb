Rails.application.routes.draw do

  resources :borrow_books
  resources :line_items
  resources :carts
  get "books/new"

  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/new/category", to: "categories#new"
  get "/new/parents", to: "parents#new"
  resources :users
  resources :authors
  resources :categories
  resources :books
end
