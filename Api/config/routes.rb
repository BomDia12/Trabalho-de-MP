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
    get 'round_begins/:id', to: 'games#construct_hands'
  end
  get 'authentication_failure',
      to: 'application#authentication_failure',
      as: :authentication_failure
end
