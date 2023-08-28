Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :posts, only: %i[index show]

  get "/cabinet", to: "pages#cabinet"

  get "/expertise", to: "pages#expertise"

  get "/equipe", to: "pages#equipe"

  get "/contact", to: "pages#contact"
end
