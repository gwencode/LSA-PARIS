Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root to: "pages#home"

  resources :posts

  get "/cabinet", to: "pages#cabinet"

  get "/expertise", to: "pages#expertise"

  get "/equipe", to: "pages#equipe"

  get "/contact", to: "contact#new"
  post "/contact", to: "contact#message"

  get "/liens-utiles", to: "pages#liens_utiles"
  get "/confidentialite", to: "pages#confidentialite"
  get "/mentions-legales", to: "pages#mentions_legales"
end
