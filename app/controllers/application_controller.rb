# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :date_of_birth, :weekly_email, :accept_terms, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :profile_image])
  end
end

# app/controllers/api/v1/application_controller.rb
module Api
  module V1
    class ApplicationController < ActionController::API
      # Common functionality for API controllers
    end
  end
end