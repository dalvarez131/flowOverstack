Rails.application.routes.draw do
  get 'search/search'

  get 'votes/create'

  get 'users/delete', to: 'users#delete'

 
  root 'questions#index'
  resources :questions do
  	resources :comments
    resources :votes
  	resources :answers, only: [:new, :create]
  end

  resources :answer do
  resources :votes
  resources :comments, only: [:new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
