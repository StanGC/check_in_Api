class Api::V1::CheckininfosController < ApiController
  def show
    @checkininfo = Checkininfo.find_by(token: params["token"])

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
    @checkininfo = Checkininfo.build( :device_id => @device.id,
                                      :token => @device.token,
                                      :lng => params[:lng],
                                      :lat => params[:lat],
                                      :comment => params[:comment],
                                      :location => params[:location],
                                      :location_photo => params[:location_photo] )

    if @checkininfo.save
      render :json => { :message => "新增成功"
                        :device_id => @checkininfo.device_id,
                        :token => @checkininfo.token,
                        :lng => @checkininfo.lng,
                        :lat => @checkininfo.lat,
                        :comment => @checkininfo.comment,
                        :location => @checkininfo.location,
                        :location_photo => @checkininfo.location_photo}
    else
      render :json => { :message => "新增失敗", :errors => @checkininfo.errors }
    end
  end

  def update
    @checkininfo = Checkininfo.find_by(token: params["token"])

    if @checkininfo.update(checkininfo_params)
      render :json => { :message => "更新成功" }
    else
      render :json => { :message => "更新失敗", :errors => @checkininfo.errors }
    end
  end

  def destroy
    @checkininfo = Checkininfo.find_by(token: params["token"])
    @checkininfo.destroy

    if @checkininfo.destroy
      render :json => { :message => "刪除成功" }
    else
      render :json => { :message => "刪除失敗", :errors => @checkininfo.errors }
    end
  end

  protected
  def checkininfo_params
    params.permit(:lng, :lat, :comment, :location, :location_photo)
  end
end
