class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :main_visual

  def main_visual
    @users = User.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :address_free, :address, :phone_number, :is_active, :user_name, :user_introduction])
  end

  def top
  end

end