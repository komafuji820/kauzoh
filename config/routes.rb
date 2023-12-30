Rails.application.routes.draw do
  devise_for :users

  root to: 'groups#index'

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'add_members'
    end
    resources :items, only: [:index, :new, :create]
    resources :orders, only: [:index, :new, :create]
    resources :purchases, only: [:index, :new, :create]
  end

  resources :users do
    collection do
      get 'search'
      get 'search_results'
    end
  end

  resources :items, only: [:edit, :update, :destroy]

  resources :orders, only: [:edit, :update, :destroy]

  resources :purchases, only: [:edit, :update]

end
