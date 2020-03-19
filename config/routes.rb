# frozen_string_literal: true

Rails.application.routes.draw do
  get 'widget/my_widgets'
  resources :widget
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'widget#index'
end
