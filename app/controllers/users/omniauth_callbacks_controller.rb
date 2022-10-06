class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    service_provider('Vkontakte')
  end

  def github
    service_provider('GitHub')
  end

  def yandex
    service_provider('Yandex')
  end

  def google_oauth2
    service_provider('Google')
  end

  def failure
    redirect_to root_path
  end

  private

  def service_provider(name)
    if user.persisted?
      set_flash_message(:notice, :success, kind: name) if is_navigational_format?

      sign_in_and_redirect user, event: :authentication
    else
      session["devise.#{name.downcase}_data"] = request.env['omniauth.auth']

      redirect_to new_user_registration_url
    end
  end

  def user
    @user = User.from_omniauth(request.env['omniauth.auth'])
  end
end
