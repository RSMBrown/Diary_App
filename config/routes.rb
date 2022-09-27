Rails.application.routes.draw do
  devise_for :users
  resource :user, only: :show
  root "entries#index"
  resources :entries
end
