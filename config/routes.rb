Rails.application.routes.draw do
  devise_for :members, controllers: { registrations: "registrations" }
  root to: "pages#index"

  resources :members, only: [:index, :show] do
    resources :profiles
  end
end
