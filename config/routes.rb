Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :members do
    resources :vaccines, only: [:show] do
      resources :appointments, only: [:show, :new, :create]
    end
  end

  get "/appointments/:id/confirmed/:id", to: "appointments#confirmed", as: :confirmed

end
