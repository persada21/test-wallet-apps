Rails.application.routes.draw do
  resources :accounts
  resources :top_ups
  resources :transfers
  resources :transactions
  resources :users
  resources :withdraws

  root 'users#index'
end
