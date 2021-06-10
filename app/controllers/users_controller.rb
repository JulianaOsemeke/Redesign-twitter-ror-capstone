class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @user = current_user
    @following = @user.following
    @followers = @user.followers
    @opinion   = @user.opinions.new
    @opinions = Opinion.all.includes(:author)
    @users = User.all
  end

  def show
    @user = current_user
    @following = @user.following
    @followers = @user.followers
    @opinion   = @user.opinions.new
    @opinions = Opinion.all.includes(:author)
    @user_opinions = @user.opinions
    @users = User.all
  end
end
