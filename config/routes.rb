Rails.application.routes.draw do
  get 'search/search'

  get 'votes/create'

  get 'users/delete', to: 'users#delete'


  root 'questions#index'
  resources :questions do
  	resources :comments
    member do
      post "votes", to: "questions#create_vote"
      delete "votes", to: "questions#delete_vote"
    end

  	resources :answers, only: [:new, :create]
  end

  resources :answer do
  resources :comments, only: [:new, :create]
  member do
      post "votes", to: "answers#create_vote"
      delete "votes", to: "answers#delete_vote"
    end

  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
