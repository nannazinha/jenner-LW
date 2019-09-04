Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :members do
    resources :vaccines, only: [:show] do
      resources :appointments, only: [:show, :new]
    end
  end
end
