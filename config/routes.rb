Rails.application.routes.draw do
  devise_for :users
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: :show
  root to: 'posts#index' 
end