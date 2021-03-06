Rails.application.routes.draw do
  root 'laundromats#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :laundromats do
    resources :washers, only: [:new, :create, :edit, :update, :destroy]
    resources :dryers, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :api do
    resources :laundromats, only: [:index, :new, :create, :update, :edit] do
      resources :washers, only: [:index]
      resources :dryers, only: [:index]
    end
  end
end
