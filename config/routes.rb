Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, :controllers => {
    registrations: 'registrations',
    omniauth_callbacks: 'callbacks'
  }

  resources :friend_requests, only: [:create, :destroy, :index]
  resources :friendships, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :comments, only: [:destroy]
  resources :users, only: [:index, :show]

  resources :posts, expect: [:show] do
    resources :likes, only: [:create]
    resources :comments, only: [:new, :create]
  end
end
