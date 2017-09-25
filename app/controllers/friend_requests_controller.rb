class FriendRequestsController < ApplicationController

  def index
  	@friend_requests = FriendRequest.where(friend:current_user)

  end

  def create
  	friend = User.find(params[:friend_id])
  	user = current_user
  	user.friend_requests.create(friend:friend)
    redirect_to users_path
  end

  def destroy
    if params[:friend_request].present?
      request = FriendRequest.find(params[:friend_request])
    else
     request = FriendRequest.find_by(user:current_user,friend:params[:friend_id]) 
   end
    request.destroy
    redirect_back(fallback_location: root_path)
  end
end
