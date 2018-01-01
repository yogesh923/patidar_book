class CommentsController < ApplicationController
	# Filters
	before_action :load_post, only: :create

	def new
		@comment = Comment.new
	end

	def create
		@comment = @post.comments.new(comment_param)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = 'commented'
		else
			flash[:success] = 'not commented'
		end
		redirect_to root_url
	end

	private

	def comment_param
		params.require(:comment).permit(:contain)
	end

	def load_post
		@post = Post.find(params[:post_id])
	end


end