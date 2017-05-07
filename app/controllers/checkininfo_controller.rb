class CheckininfoController < ApplicationController
  def index
    @checkininfos = Checkininfo.paginate(:page => params[:page], :per_page => 10)

    @hash = Gmaps4rails.build_markers(@checkininfos) do |checkininfo, marker|
      marker.lat checkininfo.lat
      marker.lng checkininfo.lng
    end
  end
end
