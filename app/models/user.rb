class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	has_and_belongs_to_many :friends,
										 class_name: "User",
										 join_table: :friendships,
										 foreign_key: :user_id,
										 association_foreign_key: :friend_user_id,
                     after_add: :add_inverse

    has_many :friend_requests,dependent: :destroy
    has_many :pending_requests, through: :friend_requests, source: :friend
    has_many :posts
    has_many :likes
    has_many :comments



  
  def add_inverse(rel) #https://collectiveidea.com/blog/archives/2015/07/30/bi-directional-and-self-referential-associations-in-rails
  rel.friends << self unless friend_exists?(rel)
  end

  def friend_exists?(rel)
    rel.friends.exists?(self.id)
  end

 
end
