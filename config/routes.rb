Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root "pages#show"
  resources :images do
    resources :comments, except: :show
    resources :likes, only: [:create, :destroy]
    resources :book_marks, only: [:create, :destroy]
    resources :reports, only: :create
    resources :shares, except: [:index, :show, :destroy]
  end
  resources :comments, only: :index do
    resources :reply_comments, except: :show
  end
  resources :popular_images, only: :index
  resources :follow_users, only: :index
  resources :users, only: [:show, :update] do
    resources :book_marks, only: :index
    resources :relationships, only: [:create, :destroy]
  end
end
