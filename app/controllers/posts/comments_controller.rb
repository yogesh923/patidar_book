class Posts::CommentsController < ApplicationController

	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.new(comment_param)

		if @comment.save
			flash[:success] = 'commented'
			redirect_to root_url
		else
			flash[:success] = 'not commented'
			redirect_to root_url
		end
	end

	def comment_param
		params.require(:comment).permit(:contain)
	end
end