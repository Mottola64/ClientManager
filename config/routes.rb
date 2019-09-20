Rails.application.routes.draw do

  resources :deliverables
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users

  resources :accounts do
    resources :deliverables, only: [:new, :create, :edit, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 