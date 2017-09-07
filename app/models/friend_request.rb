class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name:"User"

  def self.friend_requests_count user 
	where(friend:user).count
  end
end
