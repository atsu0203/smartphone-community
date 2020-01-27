class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, {only: [:edit,:update,:destroy]}

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path
    end
  end
end
