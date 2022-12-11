# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applicants
  resources :funds
  resources :payments, only: [:index]
  resources :projects

  root 'applicants#index'
end
