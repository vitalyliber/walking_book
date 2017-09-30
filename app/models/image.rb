class Image < ApplicationRecord
  mount_uploader :file, ImageUploader
  validates_presence_of :file
end
