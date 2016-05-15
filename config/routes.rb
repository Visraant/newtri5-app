Rails.application.routes.draw do
  devise_for :hospitals
  
  # get '/' => 'patients#index'
  get '/patients' => 'patients#index'
  get '/patients/new' => 'patients#new'
  post '/patients' => 'patients#create'
  get '/patients/:id' => 'patients#show'
  get '/patients/:id/edit' => 'patients#edit'
  patch '/patients/:id' => 'patients#update'
  delete '/patients/:id' => 'patients#destroy'
 ##########################################################
  get '/' => 'hospitals#index'
  get '/hospitals' => 'hospitals#index'
  get '/hospitals/new' => 'hospitals#new'
  post '/hospitals' => 'hospitals#create'
  get '/hospitals/:id' => 'hospitals#show'
  get '/hospitals/:id/edit' => 'hospitals#edit'
  patch '/hospitals/:id' => 'hospitals#update'
  delete '/hospitals/:id' => 'hospitals#destroy'
 ##########################################################
  get '/emt' => 'emt#index'
  get '/emt/new' => 'emt#new'
  post '/emt' => 'emt#create'
  get '/emt/:id' => 'emt#show'
  get '/emt/:id/edit' => 'emt#edit'
  patch '/emt/:id' => 'emt#update'
  delete '/emt/:id' => 'emt#destroy'
 ##########################################################
end
