class UsersController < ApplicationController
  def show
    @group = Group.new
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(6).order("created_at DESC")
    @true_user_msg = Group.where(id: GroupUser.where(user_id: @user.id).pluck(:group_id)).find_by(id: GroupUser.where(user_id: current_user.id).pluck(:group_id))
  end
end
