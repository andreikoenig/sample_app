class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # validate_ because it is a custom validation (vs validateS)
  validate :picture_size

  private

  # validates the size of an uploaded image
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5Mb")
    end
  end
end
