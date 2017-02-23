class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    if current_user.admin == true
   #   rails_admin_path
    elsif current_user.member == true
      reservations_path
    elsif current_user.guest == true
      root_path
    end
  end
end
