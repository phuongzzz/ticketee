Rails.application.routes.draw do
  devise_for :users
  root "projects#index"

  resources :projects, except: [:new, :create, :destroy] do
    resources :tickets
  end

  namespace :admin do
    root "application#index"

    resources :projects, only: [:new, :create, :destroy]
  end
end
