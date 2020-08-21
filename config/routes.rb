Rails.application.routes.draw do
  root 'items#index'

  get 'messages/index'

  root "messages#index"
end
