Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  resources :clubs, only: [:index, :show] do
    resources :players, only: [:new, :create]
  end
  resources :games do
    resources :reports, only: [:new, :show, :create]
  end
  resources :reports, only: [:index]
  resources :competitions, only: [:index, :show]
  resources :referees, only: [:index, :edit, :update]
end
