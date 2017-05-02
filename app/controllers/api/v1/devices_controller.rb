class Api::V1::DevicesController < ApiController
  def create
    @user = User.find_by(authentication_token: params["authentication_token"] )
    @user ? @user : (render :json => { :message => "驗證失敗" })
    if @user
      @device = Device.new( :user_id => @user.id,
                            :token => params[:authentication_token],
                            :operating_system => params[:operating_system],
                            :version => params[:version],
                            :avatar => @user.avatar,
                            :name => @user.name )

      if @device.save
        render :json => { :message => "新增成功", :errors => @device.errors , :status => 200,
                          :user_id => @device.user_id,
                          :token => @device.token,
                          :operating_system => @device.operating_system,
                          :version => @device.version,
                          :avatar => @device.avatar,
                          :name => @device.name}
      else
        render :json => { :message => "新增失敗", :errors => @device.errors }, :status => 400
      end
    end
  end
end
