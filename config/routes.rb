Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {sessions: 'admin/sessions'}
  devise_for :users, skip: [:passwords], controllers:{registrations: "user/registrations", 
                                                      sessions:      'user/sessions'}
  root to: 'homes#top'
  get 'aboutUs' => 'homes#aboutUs'
  resources :news, only:[:index]
  resources :contacts

  resources :posts

  resources :users, skip: [:new, :create]
  #resources :admin
end
