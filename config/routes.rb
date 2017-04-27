Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'answer/create'

  get 'answer/new'

  get 'question/show'

  root 'questions#index'
  resources :questions do
  	resources :comments
  	resources :answers, only: [:new, :create]
  end

  resources :answer do
  resources :comments, only: [:new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
