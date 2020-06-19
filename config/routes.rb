Rails.application.routes.draw do
    root to: "rentals#index"
    get '/admin/all_listing', to: "pages#listing"
    get "pages/contact"
    get '/who_we_are', to: "pages#home"
    resources :rentals
    resources :estates
    resources :towns
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
