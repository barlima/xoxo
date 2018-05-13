Rails.application.routes.draw do

  root to: 'static#home'

  resources :rooms
  resources :users#, only: [:new]

  mount ActionCable.server => '/cable'
end
