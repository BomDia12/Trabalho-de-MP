Rails.application.routes.draw do
  post 'user/register'
  post 'user/login'
  delete 'user/logout'
  get 'user/show'
  put 'user/edit'
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
