class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[email name password password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[password password_confirmation current_password]
    )
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end
end
