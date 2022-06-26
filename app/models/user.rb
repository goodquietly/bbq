class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :thumb_big, resize_to_limit: [400, 400]
  end

  validates :avatar, file_size: { less_than_or_equal_to: 2.megabytes },
                     file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

  private

  def set_name
    self.name = "#{I18n.t('activerecord.models.comrade')}#{rand(777)}" if name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email)
                .update_all(user_id: id)
  end
end
