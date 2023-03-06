Rails.application.routes.draw do
  devise_for :users
  root to: "boards#index"

  get "profile", to: "pages#profile"

  resources :boards, except: :index do
    resources :rents, only: %i[new create show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
