Rails.application.routes.draw do
  root to: 'groups#index'
  resources :groups, only: [:index]
end
