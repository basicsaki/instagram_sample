Rails.application.routes.draw do

  root 'pages#home'

  get "sessions/connect"
  get "sessions/callback"
  get "sessions/disconnect"

  get 'pages/integration'
  get 'pages/user_pics'

end