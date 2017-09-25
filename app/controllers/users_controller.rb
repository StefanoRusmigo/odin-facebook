class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show 
		@user = User.find(params[:id])
	end

	def friends
		@friends = current_user.friends
	end
end
