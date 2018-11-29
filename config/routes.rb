Rails.application.routes.draw do
  root to: 'pages#index'
  get '/entrar', to: 'sessions#new', as: 'entrar'
  post '/entrar', to: 'sessions#create'
  delete '/sair', to: 'sessions#destroy'

  get '/sobre', to: 'pages#sobre', as: 'sobre'
  get '/contato', to: 'pages#contato', as: 'contato'

  resources :contacts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
