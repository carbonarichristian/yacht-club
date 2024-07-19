Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

 resources :yachts do
    resources :bookings, only: [:create]
 end

 resources :bookings, only: [:index, :show, :destroy, :update]

 namespace :user do
    resources :yachts, only: [:index]
    resources :bookings, only: [:index, :edit, :update]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
