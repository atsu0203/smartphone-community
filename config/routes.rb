Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
  resources :categories, only: :show 
end