Rails.application.routes.draw do
  resources :resource_metadata, :users
  resolve("resources") { [:resource_metadata] }

  get '/resources' => 'resource_metadata#index'
  get '/resources/new' => 'resource_metadata#new'
end
