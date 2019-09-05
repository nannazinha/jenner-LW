Rails.application.routes.draw do

  devise_for :users

  root to: 'members#index'

  resources :members do
    resources :vaccines, only: [:show]
  end

  resources :appointments, only: [:show, :new, :create]

end
