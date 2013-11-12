Varkek::Application.routes.draw do
  
  namespace :admin do
    resources :topic_groups
    
    resources :topics do 
      resources :questions do 
        member do 
          post :add_context
          delete :delete_context
        end
        resources :responses
        resources :directions
        resources :transitions
      end
    end
    resources :users
    root to: 'topics#index'
  end

  namespace :api do 
    namespace :v1 do
      resources :topics, only: [:index, :show]
    end
  end
  

  # nuke this
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

  if ['development', 'test'].include?(Rails.env)
    mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
  end
end
