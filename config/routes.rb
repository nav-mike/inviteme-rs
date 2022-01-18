# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signin', to: 'panel/user_sessions#new'

  namespace :panel do
    resource :user_sessions, only: %i[create destroy], as: :sessions
  end

  scope :admin do
  end

  scope :api do
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
end
