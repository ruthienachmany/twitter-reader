TwitterReader::Application.routes.draw do
  devise_for :users

  resources :users
  resources :links
  root :to => 'links#index'
  
  match 'auth/twitter/callback', to: 'sessions#create'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get 'login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/:id', to: 'sessions#destroy'
  match 'auth/failure', to: redirect('/')
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  match 'signout', to: 'sessions#destroy', as: 'signout'
end

