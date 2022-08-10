# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json

  protected

  def configure_permitted_parameters
    attributes = %i[first_name last_name religion street_address city country postal_code phone_number
                    mobile_number gender]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
