class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @iined_tweets = @user.iined_tweets
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings

  end

  def followers
    user = User.find(params[:id])
    @users = user.followers

  end
end