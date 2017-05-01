Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      post "/device" => "device#create", :as => :create_device

      get "/checkininfo/:token" => "checkininfo#show", :as => :checkininfo
      post "/checkininfo" => "checkininfo#create", :as => :create_Checkininfo
      patch "/checkininfo/:token" => "checkininfo#update", :as => :update_checkininfo
      delete "/checkininfo/:token" => "checkininfo#destroy", :as => :cancel_checkininfo
    end
  end
end
