Rails.application.routes.draw do
  get 'items/index'

  get 'messages/index'

  root "messages#index"
end
