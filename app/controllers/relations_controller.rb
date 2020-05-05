class RelationsController < ApplicationController
  def create
    current_user.actives.create(follower_id: params[:user_id])
    redirect_to users_path
  end

  def destroy
    follow = current_user.actives.find_by(follower_id: params[:user_id])
    follow.delete
    redirect_to root_path
  end
end
