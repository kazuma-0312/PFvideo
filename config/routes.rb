Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "tweets#index"

  resources :tweets do
    resources :comments, only: :create
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  end
  resources :users, only: [:index, :show] do
      collection do
        get :likes
      end
  end
end
