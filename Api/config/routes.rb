Rails.application.routes.draw do
  get 'user/register'
  get 'user/login'
  get 'user/logout'
  get 'user/show'
  get 'user/edit'
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
