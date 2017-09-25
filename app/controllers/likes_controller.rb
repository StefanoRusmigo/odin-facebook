class LikesController < ApplicationController

  def create
    Like.create(user:current_user,likeable_type:params[:type],likeable_id:params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	Like.find_by(user:current_user,likeable_id:params[:id],likeable_type:params[:type]).delete
  	redirect_back(fallback_location: root_path)
  end


end
