Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root "pages#show"
  resources :popular_images, only: :index
  resources :follow_users, only: :index
  resources :users, only: [:show, :edit]
end
