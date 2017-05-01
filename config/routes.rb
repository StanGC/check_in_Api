Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      post "/devices" => "devices#create", :as => :create_devices

      get "/checkininfo/:token" => "checkininfo#show", :as => :checkininfo
      post "/checkininfo" => "checkininfo#create", :as => :create_Checkininfo
      patch "/checkininfo/:token" => "checkininfo#update", :as => :update_checkininfo
      delete "/checkininfo/:token" => "checkininfo#destroy", :as => :cancel_checkininfo
    end
  end
end
