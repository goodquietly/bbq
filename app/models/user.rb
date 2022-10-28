class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[vkontakte github yandex google_oauth2]
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :thumb_big, resize_to_limit: [400, 400]
  end

  validates :avatar, file_size: { less_than_or_equal_to: 2.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)

    return user if user.present?

    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |new_user|
      new_user.name = auth.info.name
      new_user.email = auth.info.email
      new_user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def set_name
    self.name = "#{I18n.t('activerecord.models.comrade')}#{rand(777)}" if name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email)
                .update_all(user_id: id)
  end
end
