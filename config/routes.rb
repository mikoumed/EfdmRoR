Rails.application.routes.draw do

    resources :users
    resources :materials
    resources :lines
    resources :intequipments
    resources :teams
    resources :events
    resources :intlines

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
