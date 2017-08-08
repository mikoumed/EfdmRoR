Rails.application.routes.draw do

    root 'static_pages#home'

    get 'users/new'
    get 'users/edit'

    get '/home',    to: 'static_pages#home'
    get '/signup',  to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
