class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  validates :photo, presence: true, file_size: { less_than_or_equal_to: 4.megabytes, message: I18n.t('activerecord.models.file_size') },
                    file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
                                         message: I18n.t('activerecord.models.file_type') }

  scope :persisted, -> { where 'id IS NOT NULL' }
end
