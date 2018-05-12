Rails.application.routes.draw do

  root to: 'static#home'

  resources :rooms
  resources :users#, only: [:new]

  get 'board/select'

  mount ActionCable.server => '/cable'
end
