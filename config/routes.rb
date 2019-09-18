Rails.application.routes.draw do

  resources :strategists
  resources :deliverables
  resources :accounts
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users

  resources :users do
    resources :accounts
  end
  

  resources :strategists do
    resources :accounts, only: [:new, :create, :index]
    resources :deliverables, only: [:new, :create, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 