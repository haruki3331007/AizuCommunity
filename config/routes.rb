Rails.application.routes.draw do
  devise_for :admin, only: [:sessions], controllers: {sessions: 'admin/sessions'}
  devise_for :users, skip: [:passwords], controllers:{registrations: "user/registrations", sessions:'user/sessions'}

  root to: 'homes#top'
  get 'aboutUs' => 'homes#aboutUs'
  resources :news
  get 'contacts/complete' => 'contacts#complete'
  resources :contacts , skip: [:show]

  resources :posts
  resources :genres
  resource :like
  resources :comments

  get 'users/complete' => 'users#complete'
  resources :users, skip: [:new, :create, :edit, :update]
  #resources :admin
end
