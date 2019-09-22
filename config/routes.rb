Rails.application.routes.draw do

  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :deliverables
  resources :accounts do
    resources :deliverables
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 