Rails.application.routes.draw do
  root to: "homes#home", as: "home"
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:create,:edit,:destroy,:update]
  resources :homes, only: [:about,:home]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
