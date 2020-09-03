Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, :controllers => {
    registrations: 'registrations'
  }

  resources :friend_requests, only: [:create, :destroy]
  resources :posts
end
