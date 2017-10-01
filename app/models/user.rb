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
    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile
    devise :omniauthable, :omniauth_providers => [:facebook]
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/




  
  def add_inverse(rel) #https://collectiveidea.com/blog/archives/2015/07/30/bi-directional-and-self-referential-associations-in-rails
  rel.friends << self unless friend_exists?(rel)
  end

  def friend_exists?(rel)
    rel.friends.exists?(self.id)
  end
  
  def timeline
    timeline = friends.map do |friend|
      friend.posts
    end
    timeline <<  posts
    timeline.flatten.sort_by(&:created_at).reverse
  end
 
 def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    p auth.info.email
   # name_ary = auth.info.name.split(" ")
   # user.create_profile(name: name_ary.first, 
   #                     surname: name_ary.last,
   #                     avatar_url:auth.info.image)   # assuming the user model has a name
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  

end
