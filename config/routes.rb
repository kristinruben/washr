Rails.application.routes.draw do
  root 'laundromats#index'

  devise_for :users
end
