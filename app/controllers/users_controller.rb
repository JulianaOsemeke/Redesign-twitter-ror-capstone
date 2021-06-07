class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @user = current_user
    @following = @user.following
    @followers = @user.followers
  end
end
