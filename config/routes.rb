Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callbacks]
 
  namespace :api do
    resources :articles, only: [:index, :show]
    resources :comments, only: [:create]
  end
end
