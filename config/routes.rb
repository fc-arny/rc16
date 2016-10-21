# frozen_string_literal: true
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root to: 'index#main'
  get 'top' => 'top#index'

  get 'users/sign_up' => redirect('/')
  get 'users/sign_in' => redirect('/')

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: %i() do
    get :profile, on: :collection
    get :top, on: :collection
  end

  resources :quests

  get 'prizes' => 'prizes#index'

  namespace :hr do
    resources :users
    resources :quests
    resources :quest_items
    root to: 'users#index'
  end
end
