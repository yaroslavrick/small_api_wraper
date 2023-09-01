# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api_wrapper#index'
  get 'api_wrapper', to: 'api_wrapper#index'
  get 'latest_activities', to: 'api_wrapper#latest_activities'
end
