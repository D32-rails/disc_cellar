Rails.application.routes.draw do
  root 'welcome#index'

  resources :dvds
  resources :users
  resources :borrowships

  get 'auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy'

end
