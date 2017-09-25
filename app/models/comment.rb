class Comment < ApplicationRecord
	belongs_to :user
	has_many :likes,as: :likeable
	belongs_to :commentable, polymorphic: true
	validates_presence_of :content
	has_many :replies, class_name:"Comment", foreign_key: :parent_id
	belongs_to :parent, class_name:"Comment",required:false
end
