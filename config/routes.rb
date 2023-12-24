Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  resources :groups, only: [:index, :new, :create, :show] do
    collection do
      get 'add_members'
    end
  end
  resources :users do
    collection do
      get 'search'
      get 'search_results'
    end
  end
end
