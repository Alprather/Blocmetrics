Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :registered_applications
  resources :sessions, only: [:new, :create, :destroy]
end
