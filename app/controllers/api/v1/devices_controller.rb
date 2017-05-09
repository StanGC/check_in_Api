class Api::V1::DevicesController < ApiController
  def create
    @device = Device.build(device_params)

    if @device.save
      render :json => { :message => "新增成功", :status => 201,
                        :user_id => @device.user_id,
                        :token => @device.token,
                        :operating_system => @device.operating_system,
                        :version => @device.version}
    else
      render :json => { :message => "新增失敗", :errors => @device.errors }
    end
  end

  protected
  def device_params
    params.require(:device).permit(:user_id, :operating_system, :version, :avatar, :name)
  end
end
