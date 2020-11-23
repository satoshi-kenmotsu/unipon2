Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit, :update, :show] do
    resources :messages, only: [:index, :create, :destroy, :edit, :update] do
      resources :likes, only: [:create, :destroy]
    end
  end
end