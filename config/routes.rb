Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :rooms, only: :show
  resources :messages
  root to: 'sessions#new'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  #resources :users do
  #  post 'login'
  #end
  
end
