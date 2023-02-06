Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  get 'posts/index'
  root 'users#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :index]
end