Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :members


  resources :laboratories, only: [:index] do
    resources :appointments
  end

  get "/appointments/:id/confirmed/:id", to: "appointments#confirmed", as: :confirmed

end
