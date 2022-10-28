class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

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

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_back(fallback_location: root_path)
  end

  def pundit_user
    UserContext.new(current_user, cookies)
  end
end
