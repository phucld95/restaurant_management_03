Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/:page" => "pages#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resource :admin, only: [:show, :edit, :update]
  resources :dishes
  resources :orders, only: [:show, :index, :create]
  get "/cart", to: "orders#show"
  resources :order_dishes, only: [:create, :update, :destroy]
  resources :tables
  resources :guests
end
