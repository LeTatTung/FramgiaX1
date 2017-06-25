Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root "pages#show"
  resources :images do
    resources :comments, except: :show
  end
  resources :comments do
    resources :reply_comments, except: :show
  end
  resources :popular_images
  resources :follow_users, only: :index
  resources :users, only: [:show, :update]
end
