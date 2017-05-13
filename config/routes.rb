Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :checkininfo
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      get "/me" => "users#show", :as => :user
      patch "/me" => "users#update", :as => :update_user

      post "/devices" => "devices#create", :as => :create_devices

      get "/checkininfos/:token" => "checkininfos#show", :as => :checkininfos
      post "/checkininfos" => "checkininfos#create", :as => :create_checkininfos
      patch "/checkininfos/:token" => "checkininfos#update", :as => :update_checkininfos
      delete "/checkininfos/:token" => "checkininfos#destroy", :as => :cancel_checkininfos
    end
  end
end
