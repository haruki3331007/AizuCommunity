Rails.application.routes.draw do
  devise_for :users
  devise_for :admin, skip: [:registrations, :passwords], controllers: {sessions: 'admin/sessions'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'aboutUs' => 'homes#aboutUs'
  resources :news, only:[:index]
  resources :posts
  #resources :user
  #resources :admin
  resources :contacts
end
