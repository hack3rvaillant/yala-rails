Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "/about", to: "pages#about"

  # This is needed for devise even if it doesn't generates routes
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }, skip: :all

  # This is a multitenant application
  # Everything is scope under the Community

  resources :communities,
    param: :slug,
    only: %i[new create update show edit],
    path_names: {edit: "admin"} do
    # Devise routes
    devise_scope :user do
      get "/login", to: "users/sessions#new", as: :login
      post "/login", to: "users/sessions#create"
      delete "/sign-out", to: "users/sessions#destroy", as: :sign_out

      get "/sign-up", to: "users/registrations#new", as: :sign_up
      post "/sign-up", to: "users/registrations#create"
      get "/passwords/new", to: "devise/passwords#new", as: :forgot_password
    end

    # Users routes
    get "/profile", to: "users#edit"
    resources :users,
      only: %i[update]

    # Courses routes
    resources :courses, only: %i[new create show update]
    resources :sections, only: %i[show update]
  end
end
