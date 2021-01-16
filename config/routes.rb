Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "tweets#index"

  resources :tweets do
    resources :comments, only: :create
    post 'like/:id' => 'likes#create', as: 'create_like'
  end
  resources :users, only: :show
end
