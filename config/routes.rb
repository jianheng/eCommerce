Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
end
