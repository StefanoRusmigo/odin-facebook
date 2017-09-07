class FriendshipsController < ApplicationController

  def index
  	@friends = current_user.friends
  end

  def create
  	request = FriendRequest.find(params[:friend_request])
  	friend = User.find(request.user.id)
  	request.delete
  	current_user.friends << friend
  	redirect_to root_url
  end

  def destroy
  	friend = User.find(params[:friend_id])
  	current_user.friends.where(friend)
  	current_user.friend_requests.where(friend:friend).delete

  	redirect_to root
  	
  end
end
