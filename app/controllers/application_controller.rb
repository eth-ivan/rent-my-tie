class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :profile_image])
  end

end

# :photo, address_attributes: [:street, :city, :zip]
