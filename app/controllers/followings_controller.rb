class FollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    current_user.follow(@user)
    redirect_to root_path
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to @user
  end

  private

  def find_user
    @user = User.find_by_id(params[:user_id])
  end
end
