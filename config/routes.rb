Rails.application.routes.draw do

  root to: 'static#home'

  resources :rooms
  resources :users#, only: [:new]

  post 'boards/update'

  mount ActionCable.server => '/cable'
end
