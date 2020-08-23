Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  get 'messages/index'

  root "messages#index"
end
