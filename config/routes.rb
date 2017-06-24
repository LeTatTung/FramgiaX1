Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root "pages#show"
  resources :images do
    resources :comments
  end
  resources :comments do
    resources :reply_comments
  end
  resources :popular_images
  resources :follow_users
  resources :users
end
