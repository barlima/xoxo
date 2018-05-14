Rails.application.routes.draw do

  root to: 'static#home'

  resources :rooms
  resources :users#, only: [:new]

  patch '/boards', to: 'boards#update'
  patch '/games', to: 'games#update'

  mount ActionCable.server => '/cable'
end
