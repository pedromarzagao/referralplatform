Rails.application.routes.draw do
  get '/auth/:user_id/:token', to: 'session#auth'
  get '/join', to:'users#join'
  get '/register', to: 'users#register'
  get 'static/home'
  get 'pages/home'
  get 'pages/help'
  root 'static#home'
  get '/resend_login', to:'users#resend_login'
  post '/resend_login', to:'users#resend_login_link'

  resources :session, only: [:new, :create]
  resources :users, only: [:create, :show, :resend_login_link]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
