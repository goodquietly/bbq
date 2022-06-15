class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 1000]
  end

  validates :photo, file_size: { less_than_or_equal_to: 4.megabytes, message: 'Please Check File Size' },
                    file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
                                         message: 'Please Check File Format' }

  scope :persisted, -> { where 'id IS NOT NULL' }
end
