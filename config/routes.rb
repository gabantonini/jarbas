Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :services do
    resources :bookings , only: [:new, :create]

  end

  resources :bookings , except: [:new, :create] do
    resources :reviews, only: [:new, :create]    
  end

  resources :reviews, only: [:update, :edit, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :user_calendars, only: [:index, :create, :destroy]

end
