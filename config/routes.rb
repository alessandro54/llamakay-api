# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#index'
  get '/health', to: 'health#health'

  resources :job_applications
  resources :jobs
  
  # Users
  post 'user', to: 'user#create'
  get 'profile', to: 'user#show'
  put 'profile/update', to: 'user#update'
  delete 'profile/destroy', to: 'user#delete'
end
 