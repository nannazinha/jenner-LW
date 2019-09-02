Rails.application.routes.draw do
  get 'members/index'
  get 'members/show'
  get 'members/new'
  get 'members/create'
  get 'members/edit'
  get 'members/update'
  get 'members/destroy'
  devise_for :users

  root to: 'pages#home'

  resources :members
end
