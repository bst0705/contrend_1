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
    get '/search', to: 'searches#search'

    resources :comments
    resources :contacts
    resources :customers, only: [:index, :show, :edit, :update]do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end
    resources :notifications
    resources :ranks
    resources :relationships
    resources :tweets do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

end
