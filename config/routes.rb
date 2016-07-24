Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'laundromats#index'
  resources :laundromats do
    resources :washers, only: [:new, :create, :edit, :update, :destroy]
    resources :dryers, only: [:new, :create]
  end
end
