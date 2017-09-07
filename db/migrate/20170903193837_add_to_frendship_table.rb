class AddToFrendshipTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :friendships, :friend_user_id,:integer
  	add_index(:friendships,[:user_id,:friend_user_id], unique: true)
  	add_index(:friendships,[:friend_user_id,:user_id], unique: true)
  end
end
