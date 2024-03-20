class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @friends = @user.friends
    @all_users = User.where.not(id: [@user.id] + @friends.pluck(:id))
  end

  
  def create
    friend = User.find(params[:friend_id])
    current_user.friends << friend
    redirect_to friends_path, notice: 'Friend added successfully.'
  end


  def destroyz
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    redirect_to friends_path, notice: 'Friend removed successfully.'
  end
end
