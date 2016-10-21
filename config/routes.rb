# frozen_string_literal: true
require 'sidekiq/web'

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
    resources :quest_items do
      post :accept, on: :member
      post :reject, on: :member
    end
    root to: 'users#index'
  end

  authenticate :user, -> (u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
