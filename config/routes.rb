Rails.application.routes.draw do
  root 'welcome#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  get "/download" => "items#download"
  resources :items
  resources :users, :only => [:index, :new, :create]
end
