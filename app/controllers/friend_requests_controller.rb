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
    request = FriendRequest.find(params[:friend_request])
    request.delete
    redirect_to requests_path

  

  end
end
