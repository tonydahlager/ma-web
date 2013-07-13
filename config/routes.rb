Varkek::Application.routes.draw do
  
  namespace :admin do 
    resources :cards
  end

  resources :cards, only: [:index, :show]
  
  get "dashboard/index" # => 'dashboard#index'
  get "dashboard"         => 'dashboard#index'

  devise_for :users, :skip => [:registrations, :invitation] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit',   as: 'edit_user_registration'
    put 'users'      => 'devise/registrations#update', as: 'user_registration'
    
    get '/users/invitation/accept' => 'devise/invitations#edit',   as: 'accept_user_invitation'
    put '/users/invitation'        => 'devise/invitations#update', as: nil
  end

  root to: 'dashboard#index'
end
