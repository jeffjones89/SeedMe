Rails.application.routes.draw do
  root to: "companies#index"
  resources :users do
    resources :companies
  end
  resources :sessions
  resources :companies, only: [:index, :show, :create] do
    resources :favorite_companies, only: [:create, :destroy]
    put 'upvote', to: "companies#upvote"
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'favorites', to: 'favorite_companies#index', as: 'favorites'
end
