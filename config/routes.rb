Rails.application.routes.draw do
  get 'questions/new'

  devise_for :users
  get 'users/index'

  root "users#index"
  resources :users
  resources :questions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
