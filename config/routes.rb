Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items, only: [:new, :create, :show, :edit, :update,:destroy] do
 end
end
