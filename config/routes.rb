Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  resources :islands

  get "user/islands", to: "islands#index_user"
  get "user/bookings", to: "bookings#index_user"

end