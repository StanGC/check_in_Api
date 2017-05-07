class CheckininfoController < ApplicationController
  def index
    @users = User.all
    @devices = Device.all
    @checkininfos = Checkininfo.all

    @hash = Gmaps4rails.build_markers(@checkininfos) do |checkininfo, marker|
      marker.lat checkininfo.lat
      marker.lng checkininfo.lng
    end
  end
end
