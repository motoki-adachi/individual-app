Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books, only: [:index, :new, :create, :show] do
    collection do
      get :top
    end
  end
  resources :users, only: [:index, :show]
  resources :authors, only: [:show]
end
