Rails.application.routes.draw do
  resources :movies
  
  get '/search', to: 'search#index', as: 'search'
  
  root 'main#index'
end