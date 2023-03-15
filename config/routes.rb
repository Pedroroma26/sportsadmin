Rails.application.routes.draw do
  get 'public_reports/show'
  devise_for :users
  root to: "pages#dashboard"

  resources :clubs do
    resources :players
  end

  resources :games, except: [:new, :create] do
    resources :reports, only: [:create, :update]

    member do
      get :report, to: "reports#show"
    end
  end

  resources :reports, only: [:index] do
    resources :report_instances, only: [:create, :destroy]
  end

  resources :competitions do
    resources :games, only: [:new, :create]
  end

  resources :referees

  resources :public_reports, only: [:show, :update]
end
