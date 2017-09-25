class CommentsController < ApplicationController
  def create
   if current_user.comments.create(comment_params)
   	flash[:success]= "Comment created"
    redirect_back(fallback_location: root_path)
else
	render 'posts/index'
end
  end

  def destroy
  end

  def update
  end

  private

  def comment_params
  	params.require(:comment).permit(:content, :commentable_id,:commentable_type,:parent_id)
  end                                                         
end
