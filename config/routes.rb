Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do

    end
  end
end
