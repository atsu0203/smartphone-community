class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_parents

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:avatar, :avatar_cache, :remove_avatar])
  end
end
