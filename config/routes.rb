Rails.application.routes.draw do
  root to: "pages#home"
  get "/admin/all_listing", to: "pages#listing"
  get "/request", to: "pages#finder"
  get "pages/contact"
  get "/rentals/:id/bookings", to: 'rentals#bookings', as: :rental_bookings
  resources :rentors
  post '/rentors/:id/completed', to: 'rentors#completed', as: :complete_rentor
  resources :rentals
  resources :estates
  resources :towns
  post   '/users/:id/make_admin', to: 'users#make_admin', as: :make_admin
  delete '/users/:id/remove_admin', to: 'users#remove_admin', as: :remove_admin
  post   '/bookings/:id/verify', to: 'bookings#verify', as: :verify_booking
  post   '/bookings/:id/complete', to: 'bookings#complete', as: :complete_booking
  delete '/bookings/:id/unverify', to: 'bookings#unverify', as: :unverify_booking
  get "/signup", to: "users#new"
  post   '/users/:id/verify', to: 'users#verify', as: :verify_user
  resources :users, except: [:new]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :bookings
  resources :customers, except: [:edit,:destroy]
  post "/customers/new", to: "customers#create"
  post   '/customers/:id/complete', to: 'customers#complete', as: :complete_request
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
