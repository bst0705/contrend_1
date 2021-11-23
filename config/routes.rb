Rails.application.routes.draw do
  devise_for :admin, skip: [:registration]
  devise_for :customers
  #, :controllers => {
  #  :sessions => 'customer/sessions'
  #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root 'customers#index'
    get '/search', to: 'searches#search'
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
    resources :comments
    resources :contacts
    resources :customers, only: [:index, :show, :edit, :update]do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
      get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    end
    resources :notifications, only: :index
    resources :relationships
    resources :tweets do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

end
