Rails.application.routes.draw do
  root to: "pages#home"
  get "/admin/all_listing", to: "pages#listing"
  get "/request", to: "pages#finder"
  get "pages/contact"
  resources :rentals
  resources :estates, except: [:index]
  resources :towns
  get "/signup", to: "users#new"
  resources :users, except: [:new]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :bookings
  resources :faqs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
