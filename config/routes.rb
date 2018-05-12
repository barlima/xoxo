Rails.application.routes.draw do

  root to: 'static#home'

  resources :rooms

  get 'board/select'

  mount ActionCable.server => '/cable'
end
