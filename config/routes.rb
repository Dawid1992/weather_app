Rails.application.routes.draw do
  root 'users_cities#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :users_cities, only: [:new, :create, :destroy, :index] do
    resources :forecast, only: [:show]
  end
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '*unmatched_route', to: 'application#raise_not_found'
end
