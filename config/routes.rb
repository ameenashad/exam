Rails.application.routes.draw do
  get 'comments/create'

  get 'answers/create'

  devise_for :users
  root "questions#index"
  resources :questions do
    resources :comments
    resources :answers
       
  end
  resources :answers do
    resources :comments    
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
