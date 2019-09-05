Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :members do
    resources :vaccines, only: [:show]
  end

  resources :appointments, only: [:show, :new, :create]

  get "/appointments/:id/confirmed/:id", to: "appointments#confirmed", as: :confirmed

end
