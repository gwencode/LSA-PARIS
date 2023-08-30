Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: "pages#home"

  resources :posts, path: "actualites"

  get "/cabinet", to: "pages#cabinet"

  get "/expertise", to: "pages#expertise"

  get "/equipe", to: "pages#equipe"

  get "/contact", to: "contact#new"
  post "/contact", to: "contact#message"

  get "/liens-utiles", to: "pages#liens_utiles"
  get "/confidentialite", to: "pages#confidentialite"
  get "/mentions-legales", to: "pages#mentions_legales"

  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
