RentalManager::Application.routes.draw do
  root "users#sign_in"

  resources :users do
    member do
      get "select_date"
      post "select_date"
    end
    collection do
      get "sign_in", "sign_out"
      post "signing_in"
    end
  end
  resources :rentals
  resources :people
  resources :houses
end
