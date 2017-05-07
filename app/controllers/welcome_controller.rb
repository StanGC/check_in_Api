class WelcomeController < ApplicationController
  def index
    @users = User.all
    @devices = Device.all
  end
end
