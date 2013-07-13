Varkek::Application.routes.draw do
  
  namespace :admin do 
    resources :cards
  end

  resources :cards, only: [:index, :show]
  
  get "dashboard/index" # => 'dashboard#index'
  get "dashboard"         => 'dashboard#index'

  devise_for :users

  root to: 'dashboard#index'
end
