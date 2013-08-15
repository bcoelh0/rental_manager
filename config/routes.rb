RentalManager::Application.routes.draw do
  root "users#landing"
  resources :users do
    collection do
      get "sign_in", "sign_out"
      post "signing_in"
    end
  end
  resources :rentals
  resources :people
  resources :houses
end
