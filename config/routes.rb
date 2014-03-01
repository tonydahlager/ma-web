Varkek::Application.routes.draw do
  
  namespace :admin do
    resources :topic_groups
    resources :topics do 
      resources :barriers do 
        resources :contexts do 
          resources :steps, except: [:index]
        end
      end
    end
    resources :users
    resources :questions do 
      resources :answers
    end
    root to: 'topics#index'
  end

  namespace :api do 
    namespace :v1 do
      resources :topics,    only: [:index, :show]
      resources :barriers,  only: [:index, :show]
      resources :contexts,  only: [:index, :show]
      resources :steps,     only: [:index, :show]
    end
  end
  
  resources :barriers, only: [:index, :show] do 
    get 'search', on: :collection
  end
  resources :contexts, only: [:show] 
  
  resources :questions, only: [:index, :show] do
    get 'search', on: :collection
  end
  resources :answers, only: [:show] 
  
  devise_for :users, :skip => [:registrations, :invitation]
  as :user do
    get 'users/edit' => 'devise/registrations#edit',   as: 'edit_user_registration'
    put 'users'      => 'devise/registrations#update', as: 'user_registration'

    get '/users/invitation/accept' => 'devise/invitations#edit',   as: 'accept_user_invitation'
    put '/users/invitation'        => 'devise/invitations#update', as: nil
  end

  root to: 'questions#index'
end
