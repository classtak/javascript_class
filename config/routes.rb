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
end
