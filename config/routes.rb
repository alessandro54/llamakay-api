# frozen_string_literal: true

Rails.application.routes.draw do

  scope '/professional' do
    post '/new', to: 'professional#create'
  end
  # Users
  get '/profile', to: 'user#show'
  post '/user', to: 'user#create'
  put '/profile', to: 'user#update'
  delete '/profile', to: 'user#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
end
