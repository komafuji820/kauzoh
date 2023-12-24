Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  resources :groups, only: [:index, :new, :create]
  resources :users do
    collection do
      get 'search'
      get 'search_results'
    end
  end
end
