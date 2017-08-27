class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.new(comment_param)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = 'commented'
		else
			flash[:error] = 'error'
		end
	end

	def comment_param
		params.require(:comment).permit(:contain)
	end
end