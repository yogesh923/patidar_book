class FriendsController < ApplicationController
  # Filters
  before_action :authenticate_user!

  def index
    @users = User.arround_people_group(current_user.id)
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def connected
    @users = current_user.friends
  end

  def active
  end

  def close
  end

  def requested
    @users = current_user.pending_friends
  end

  def received
    @users = current_user.requested_friendships
  end

end