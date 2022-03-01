# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vehicles, only: %i[create destroy] do
    resources :locations, shallow: true, only: %i[create], controller: :locations
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
