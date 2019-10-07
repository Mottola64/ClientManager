Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fbcreate'

  resources :users do
    resources :accounts
  end
  
  
  resources :accounts do
    resources :deliverables
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 