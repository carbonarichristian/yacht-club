Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

 resources :yachts do
    resources :bookings, only: [:new, :create, :index, :show, :edit, :update]
 end

  get "up" => "rails/health#show", as: :rails_health_check
end
