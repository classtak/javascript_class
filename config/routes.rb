Rails.application.routes.draw do
  # '/'
  root 'boards#index'
  # CRUD
  # C - new, create
  get '/boards/new' => 'boards#new' # new
  post '/boards' => 'boards#create' # create
  # R - index, show
  get '/boards' => 'boards#index' # index
  get '/boards/:id' => 'boards#show' # show
  # U - edit, update
  get '/boards/:id/edit' => 'boards#edit' # edit
  put '/boards/:id' => 'boards#update' # update
  # D - delete
  delete '/boards/:id' => 'boards#destroy' # destroy

  # SIGN IN / UP / OUT
  # sign in
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#user_signin'

  # sign up
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#user_signup'

  # sign out
  delete '/signout' => 'sessions#signout'
end
