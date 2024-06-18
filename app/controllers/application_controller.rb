# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email_or_username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image, :first_name, :last_name, :username, :date_of_birth, :weekly_email, :terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image, :first_name, :last_name, :username, :date_of_birth, :weekly_email, :terms_and_conditions])
  end
end
