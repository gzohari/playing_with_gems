TestPhoto::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :photos


  devise_for :users
  root to: 'home#index'
  resources :users, only: 'show'
end
