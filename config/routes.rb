Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'members#index'

  resources :members do
    resources :vaccines, only: [:show]
  end
  resources :vaccines, only:[:index]

  resources :appointments, only: [:show, :new, :create, :index]

  resources :member_vaccines, only: [:show], as: :member_vaccine_show

  post '/vaccinate_member', to: "vaccines#vaccinate", as: "vaccinate"

  get 'confirmed/:id', to: 'appointments#confirmed', as: 'confirmed'

end
