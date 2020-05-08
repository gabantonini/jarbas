Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :services
  
  get 'bookings/:booking_id/reviews/new', to: "reviews#new" 
  post 'bookings/:booking_id/reviews', to: "reviews#create", as: "booking_reviews"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'reviews/:id/edit', to: "reviews#edit"
  put 'reviews', to: "reviews#update", as: "review"

end
