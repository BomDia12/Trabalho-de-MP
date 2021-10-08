Rails.application.routes.draw do
  devise_for :users, skip: :all

  post 'user/register'
  post 'user/login'
  delete 'user/logout'
  get 'user/show'
  put 'user/edit'

  get 'authentication_failure',
      to: 'application#authentication_failure',
      as: :authentication_failure
end
