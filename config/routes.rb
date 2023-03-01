Rails.application.routes.draw do
  root 'posts#index'

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index. :show]
  end
end
