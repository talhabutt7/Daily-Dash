# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
end

# app/controllers/api/v1/application_controller.rb
module Api
  module V1
    class ApplicationController < ActionController::API
      # Common functionality for API controllers
    end
  end
end