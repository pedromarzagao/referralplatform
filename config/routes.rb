Rails.application.routes.draw do
  get '/auth/:user_id/:token', to: 'session#auth'
  get '/register', to: 'users#register'
  get 'static/home'
  get 'pages/home'
  get 'pages/help'
  root 'static#home'

  resources :tokens, only: [:new, :create, :index]
  resources :session, only: [:new, :create]
  resources :users, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
