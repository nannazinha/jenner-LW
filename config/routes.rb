Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

<<<<<<< HEAD
  resources :members

=======
  resources :members do
    resources :appointments
  end
>>>>>>> d1ce5f9358a856ff46185c688e9037619d03b385
end
