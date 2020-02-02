class UsersController < ApplicationController
  def show
    @group = Group.new
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.page(params[:page]).per(6).order("created_at DESC")
    @ture_user_msg = Group.find_by(name: @user.nickname, id: GroupUser.where(user_id: @user.id).pluck(:group_id))
  end
end
