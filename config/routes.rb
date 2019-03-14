Rails.application.routes.draw do
  resources :resource_metadata, :users
  resolve("resources") { [:resource_metadata] }

  root to: 'users#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/resources' => 'resource_metadata#index'
  get '/resources/new' => 'resource_metadata#new'
end
