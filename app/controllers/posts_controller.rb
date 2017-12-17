class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def show
	end

	def create
		@post = current_user.posts.create(post_params)
		@post = @post.attachments.new(attachment_param)
		if @post.save
			flash[:success] = "Post Create successfully"
			redirect_to root_url
		else
			flash[:notice] = "Post not create"
			redirect_to root_url
		end
	end

	def new
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end

	def attachment_param
		params.require(:post).permit(:image)
	end

end