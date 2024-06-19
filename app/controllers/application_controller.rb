# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Configure the parameters which are allowed to be submitted by the user.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :date_of_birth, :weekly_email, :terms_and_conditions ,:profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :weekly_email, :profile_image])
  end
end
