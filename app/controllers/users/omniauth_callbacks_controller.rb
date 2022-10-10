class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    service_provider(t('controllers.devise.vkontakte'))
  end

  def github
    service_provider(t('controllers.devise.github'))
  end

  def yandex
    service_provider(t('controllers.devise.yandex'))
  end

  def google_oauth2
    service_provider(t('controllers.devise.google'))
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
      session[t('controllers.devise.session', name: name.downcase)] = request.env['omniauth.auth']

      redirect_to new_user_registration_url
    end
  end

  def user
    @user = User.from_omniauth(request.env['omniauth.auth'])
  end
end
