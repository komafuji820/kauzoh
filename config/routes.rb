Rails.application.routes.draw do
  devise_for :users

  root to: 'groups#index'

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'add_members'
    end
    resources :items, only: [:index, :new, :create]
  end

  resources :users do
    collection do
      get 'search'
      get 'search_results'
    end
  end

end
