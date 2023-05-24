Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/search', to: 'users#search', as: 'search_users'

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end 
end
