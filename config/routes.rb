Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get '/patients' => 'patients#index'
    get '/patients/:id' => 'patients#check_in'
    get '/emts' => 'emts#index'
    end
  end

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
  get '/hospitals/checkins' => 'hospitals#checkins'
  post '/hospitals' => 'hospitals#create'
  # get '/hospitals/:id' => 'hospitals#show'
  get '/hospitals/emts' => 'hospitals#show'
  get '/hospitals/:id/edit' => 'hospitals#edit'
  patch '/hospitals/:id' => 'hospitals#update'
  delete '/hospitals/:id' => 'hospitals#destroy'
 ##########################################################
  get '/emts' => 'emts#index'
  get '/emts/new' => 'emts#new'
  post '/emts' => 'emts#create'
  get '/emts/:id' => 'emts#show'
  get '/emts/:id/edit' => 'emts#edit'
  patch '/emts/:id' => 'emts#update'
  delete '/emts/:id' => 'emts#destroy'
 ##########################################################
end
