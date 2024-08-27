# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  post 'simple_job', to: 'pages#simple_sidkiq_job'
  mount Sidekiq::Web => '/sidekiq'
end
