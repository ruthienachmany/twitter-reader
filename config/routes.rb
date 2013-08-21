TwitterReader::Application.routes.draw do
  resources :users
  resources :links
  root :to => 'links#index'
  
  match 'auth/twitter/callback', to: 'sessions#create'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  match 'auth/failure', to: redirect('/')

  match 'signout', to: 'sessions#destroy', as: 'signout'
end

