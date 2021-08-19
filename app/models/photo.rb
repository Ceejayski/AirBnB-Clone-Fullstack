class Photo < ApplicationRecord
  belongs_to :room
  mount_uploader :image, ImagesUploader
  serialize :image, JSON

  validates :image, file_size: { less_than: 10.megabytes }
end
