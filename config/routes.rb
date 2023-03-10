Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  resources :clubs, only: [:index, :show] do
    resources :players, only: [:new, :create]
  end
  resources :games do
    resources :reports, only: [:create, :update]

    member do
      get :report, to: "reports#show"
    end
  end
  resources :reports, only: [:index] do
    resources :report_instances, only: [:create, :destroy]
  end
  resources :competitions, only: [:index, :show]
  resources :referees
end
