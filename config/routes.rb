Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index, :show]
    resources :comments, only: [:create]
  end
end
