Rails.application.routes.draw do


  resources :answers
  resources :responses
  resources :surveys
  resources :questions
  resources :choices
  resources :answers
  resources :responses
  resources :surveys
  resources :questions
  resources :responses
  resources :surveys
  resources :choices
  resources :answers
  resources :responses
  resources :surveys
  resources :choices
  resources :answers
  resources :responses
  resources :surveys
  resources :questions
  resources :choices
  resources :answers
  resources :surveys
  #
  resources :responses
  resources :surveys
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
