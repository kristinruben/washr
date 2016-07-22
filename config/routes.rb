Rails.application.routes.draw do
  root 'laundromats#index'
  resources :laundromats do
    resources :washers, only: [:new, :create, :edit, :update, :destroy]
    resources :dryers, only: [:new, :create, :edit, :update, :destroy]
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
  end
end
