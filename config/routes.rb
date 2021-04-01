Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resource :communities, only: %i[new create]

  constraints subdomain: /.*/ do
    get '/onboarding', to: 'onboarding#index', as: :onboarding
  end
end
