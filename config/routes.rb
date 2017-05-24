Rails.application.routes.draw do
  devise_for :users

  root "pages#index"
  get "/pages/:page", to: "pages#show"

end
