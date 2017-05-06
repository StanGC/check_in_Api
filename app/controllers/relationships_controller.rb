class RelationshipsController < ApplicationController
  before_action :authenticate_user_from_token!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
