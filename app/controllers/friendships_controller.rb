class FriendshipsController < ApplicationController
	# Filters
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend requested."
      redirect_to :back
    else
      flash[:error] = "Unable to request friendship."
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.where(user_id: params[:id], friend_id: current_user).uniq.last
    if @friendship.accepted!
      redirect_to root_url, notice: "Successfully confirmed friend!"
    else
      redirect_to root_url, notice: "Sorry! Could not confirm friend!"
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to :back
  end
end
