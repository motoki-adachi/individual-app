Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :books, only: %i[index new create show] do
    collection do
      get :top
    end
  end
  resources :users, only: [:show]
  resources :registers, only: [:create] do
    member do
      get :register
      post :register_create
    end
  end
end
