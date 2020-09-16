Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit, :update] do
    resources :messages, only: [:index, :create]
  end
end