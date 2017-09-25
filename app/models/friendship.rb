class Friendship < ApplicationRecord

  after_destroy :destroy_inverse if :rel_exists?
	

  def destroy_inverse
    self.class.where(inverse_options).destroy_all
  end

  def inverse_options
    {user_id:friend_user_id, friend_user_id:user_id}
  end	

  def rel_exists?
  	self.class.where(inverse_options).exists?
  end
end
