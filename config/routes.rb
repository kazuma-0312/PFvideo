Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "tweets#index"

  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
