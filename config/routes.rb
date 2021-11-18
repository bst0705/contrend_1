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
    root 'ranks#monthrank'
    get '/search', to: 'searches#search'
    get 'ranks/dayrank', to: 'ranks#dayrank', as: 'dayrank'
    get 'ranks/weekrank', to: 'ranks#weekrank', as: 'weekrank'
    get 'ranks/monthrank', to: 'ranks#monthrank', as: 'monthrank'
    get 'ranks/yearrank', to: 'ranks#yearrank', as: 'yearrank'
        # get :dayrank
        # get :weekrank
        # get :monthrank
        # get :yearrank

    resources :comments
    resources :contacts
    resources :customers, only: [:index, :show, :edit, :update]do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
    end
    resources :notifications
    resources :relationships
    resources :tweets do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

end
