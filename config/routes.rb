Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    # sessions:      'users/sessions',
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
