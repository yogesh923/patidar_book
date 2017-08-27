class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :load_user, :only => [:profile, :update, :home, :friends]
	def index
		@user = User.find(current_user.id)
	end

	def new
		
	end

	def home
		# @other_users = User.where('id != ?',current_user.id)
		@posts = Post.all.order('id desc')
	end

	def people_book
		@other_users = User.where('id != ?',current_user.id)
	end

	def business_book
		
	end

	def show
		@user = User.find(params[:id])
	end

	def edit

	end

	def update
		@user = current_user.attachments.new(user_params)
		if @user.save
			flash[:notice] = 'Profile update Successfully.......'
		else
			flash[:alert] = 'Profile not update Successfully.......' 
		end	
	end

	def friends
		@friends = @user.friends
	end

	def profile
		# @user = User.attachements.build		
		@attachements = @user.attachments
	end

	private
	def load_user
		@user = User.find(current_user.id)
	end

	def user_params
    params.require(:user).permit(:image)
  end

end