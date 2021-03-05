Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :islands do
    resources :bookings, only: [ :new, :create ]
  end

  get "user/islands", to: "islands#index_user"
  get "user/bookings", to: "bookings#index_user"

  resources :booking do
    member do
      patch "accept", to: "bookings#accept"
      patch "refuse", to: "bookings#refuse"
      patch "cancel", to: "bookings#cancel"
    end
  end


  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  
  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
