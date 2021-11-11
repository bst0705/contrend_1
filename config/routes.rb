Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :customers
    resources :tweets
    resources :contacts
  end

  scope module: :customer do
    root 'ranks#index'

    resources :comments
    resources :contacts
    resources :customers
    resources :likes
    resources :notifications
    resources :ranks
    resources :relationships
    resources :tweets
  end

end
