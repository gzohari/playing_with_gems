TestPhoto::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action


  devise_for :users
  root to: 'home#index'
  resources :users, only: 'show'
end
