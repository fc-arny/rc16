# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/sign_up' => redirect('/')
  get 'users/sign_in' => redirect('/')

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: %i() do
    get :profile, on: :collection
    get :top, on: :collection
  end

  resources :quests

  get 'prizes' => 'prizes#index'
  get 'top' => 'top#index'

  root to: 'index#main'
end
