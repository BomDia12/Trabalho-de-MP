# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  scope 'user' do
    post 'register', to: 'user#register'
    post 'login', to: 'user#login'
    delete 'logout', to: 'user#logout'
    get 'show', to: 'user#show'
    put 'edit', to: 'user#edit'
  end

  scope 'games' do
    post 'new', to: 'games#create_game'
    post 'play', to: 'games#play'
    get '/:id', to: 'games#show_game'
    get '/round/:id', to: 'games#show_round'
    get '/hand/:id', to: 'games#show_hand'
    get '/table/:id', to: 'games#show_table'
    scope 'truco' do
      post 'ask', to: 'games#ask_truco'
      post 'response', to: 'games#truco_response'
    end
    post 'give_up', to: 'games#give_up'
  end

  get 'authentication_failure',
      to: 'application#authentication_failure',
      as: :authentication_failure
end
