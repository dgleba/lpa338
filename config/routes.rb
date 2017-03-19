Rails.application.routes.draw do


  #
  resources :responses
  resources :surveys
  resources :question_lists
  resources :questions
  resources :choices
  resources :answers

  
  devise_for :users

  scope "/admin" do
    resources :users
  end

  #administrate gem... 2016-06-08 David Gleba
  namespace :admin do
    resources :roles
    resources :users
    root to: "roles#index"
  end

  resources :roles
  resources :users

  mount RailsAdmin::Engine => '/radmin', as: 'rails_admin'

  root 'home#index'
end
