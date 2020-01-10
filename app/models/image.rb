class Image < ApplicationRecord
  #association
  belongs_to :animal, optional: true
  mount_uploader :image, ImageUploader

  #validation
  validates :image, presence: true
end
