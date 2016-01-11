class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :custom_devise_parameters, if: :devise_controller?

  protected

  def custom_devise_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :phone) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :phone) }
    devise_parameter_sanitizer.for(:update) { |u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation, :phone, :current_password) }
  end

end
