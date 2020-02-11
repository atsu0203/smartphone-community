class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_parents

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def talk_user
    # @post_date_relationship = Relationship.where(follow_id: current_user.id)
    @post_date_likes =  Like.where(post_id: current_user.post_ids)
    @post_date_comment = Comment.where(post_id: current_user.post_ids)
    @post = Post.new
    @talk_user = User.includes(:messages,:groups,:group_users).where(id: GroupUser.includes(:user,:group).where(group_id: current_user.groups.ids).where.not(user_id: current_user.id).pluck(:user_id)).order("updated_at DESC").limit(6)
  end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:avatar, :avatar_cache, :remove_avatar])
  end
end
