Rails.application.routes.draw do
  devise_for :users

  root to: 'groups#index'

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'add_members'
      get 'new_own_group'
      post 'create_own_group'
    end
    member do
      get 'calculate_unit_price'
    end
    resources :items, only: [:index, :new, :create]
    resources :orders, only: [:index, :new, :create]
    resources :purchases, only: [:new, :create]
  end

  resources :users do
    collection do
      get 'search'
      get 'search_results'
    end
  end

  resources :items, only: [:edit, :update, :destroy]

  resources :orders, only: [:edit, :update, :destroy] do
    collection do
      delete 'destroy_checked'
    end
  end

  resources :purchases, only: [:edit, :update, :destroy]

end
