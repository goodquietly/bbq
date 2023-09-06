class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, length: { maximum: 25 },
                        format: { with: /\A[а-яА-Яa-zA-Z\s]+\z/i }, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
                         unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :check_who_is_the_owner, if: -> { user.present? }
  validate :check_if_email_is_busy, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def check_who_is_the_owner
    errors.add(:user, I18n.t('activerecord.models.errors.event_owner')) if user == event.user
  end

  def check_if_email_is_busy
    errors.add(:user_email, I18n.t('activerecord.models.errors.email_is_busy')) if User.exists?(email: user_email)
  end
end
