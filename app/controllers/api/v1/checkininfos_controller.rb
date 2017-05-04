class Api::V1::CheckininfosController < ApiController

  def show
    @checkininfo = Checkininfo.find_by(token: params["token"] )

    render :json => {
      :device_id => @checkininfo.device_id,
      :token => @checkininfo.token,
      :lng => @checkininfo.lng,
      :lat => @checkininfo.lat,
      :comment => @checkininfo.comment,
      :location => @checkininfo.location,
      :location_photo => @checkininfo.location_photo
    }
  end

  def create
    @device = Device.find_by(token: params["authentication_token"] )

    @device ? @device : (render :json => { :message => "驗證失敗" })

    if @device
      @checkininfo = Checkininfo.new( :device_id => @device.id,
                                      :token => @device.token,
                                      :lng => params[:lng],
                                      :lat => params[:lat],
                                      :comment => params[:comment],
                                      :location => params[:location],
                                      :location_photo => params[:location_photo] )

      if @checkininfo.save
        render :json => { :message => "新增成功", :errors => @checkininfo.errors , :status => 200,
                          :device_id => @checkininfo.device_id,
                          :token => @checkininfo.token,
                          :lng => @checkininfo.lng,
                          :lat => @checkininfo.lat,
                          :comment => @checkininfo.comment,
                          :location => @checkininfo.location,
                          :location_photo => @checkininfo.location_photo}
      else
        render :json => { :message => "新增失敗", :errors => @checkininfo.errors }, :status => 400
      end
    end
  end
end
