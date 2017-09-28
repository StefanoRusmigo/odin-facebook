class PostsController < ApplicationController

	def index
		@timeline = current_user.timeline
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post =current_user.posts.build(posts_params)

		if @post.save
			flash[:success] = "Post has been succuessfully created"
		redirect_back(fallback_location: posts_path)
		else
			render 'new'
		end
	end

	def edit
		 @post = current_user.posts.find(params[:id])

	end

	def update
	  @post = current_user.posts.find(params[:id])
	  if @post.update_attributes(posts_params)
	  	flash[:success] = "Post has been succuessfully edited"
		redirect_back(fallback_location: posts_path)
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def delete
      @post = current_user.posts.find(params[:id])

      @post.delete
	end

	
	private

	def posts_params
		params.require(:post).permit(:content)
	end

end
