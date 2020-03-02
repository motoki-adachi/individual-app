Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books, only: [:index, :new, :create, :show] do
    collection do
      get :top
      get :search
    end
  end
  resources :users, only: [:index, :show]
  resources :authors, only: [:show]
  resources :registers, only: [:create] do
    member do
      get :register
      post :register_create
    end
  end
end
