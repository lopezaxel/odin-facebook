Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  resources :friend_requests, only: [:create, :destroy]
end
