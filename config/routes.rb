Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes/top"
  get "homes/about"
  resources :news, only:[:index]
  resources :posts
  resources :user
  resources :admin
  resources :contacts, only: [:new, :create]
end
