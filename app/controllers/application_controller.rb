class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin == true
      rails_admin_path
    elsif current_user.member == true
      members_index_path
    elsif current_user.guest == true
      root_path
    end
  end
end
