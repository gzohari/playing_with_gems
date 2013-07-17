TestPhoto::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :photos


  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resources :users, only: 'show'
end
