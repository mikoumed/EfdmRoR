Rails.application.routes.draw do

    resources :users
    resources :materials
    resources :lines
    resources :checklists
    resources :working_teams
    resources :intequipments do
        member do
            patch 'close'
            get 'restore'
        end
    end
    resources :teams
    resources :events
    resources :intlines do
        member do
            patch 'close'
            get 'restore'
        end
    end
    resources :issues


    # get 'intlines/:id/restore', to: 'intlines#restore', as: 'restore'
    # get '/ok_line', to: 'intlines#restore'

    post '/newEvent', to: 'events#create'

    post '/newHSline', to: 'intlines#create'
    post '/newHsEquipment', to: 'intequipments#create'

    get 'sessions/new'

    root 'static_pages#home'

    get 'users/new'
    get 'users/edit'

    get '/home',    to: 'static_pages#home'
    get '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'



    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :account_activations, only: [:edit]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
