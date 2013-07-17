TestPhoto::Application.routes.draw do
  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :photos


  devise_for :users
  ActiveAdmin.routes(self)
  resources :users, only: 'show'
end
