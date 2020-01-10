class Image < ApplicationRecord
  #association
  belongs_to :animal, optional: true
  mount_uploader :image, ImageUploader

  #validation
  validates :image, presence: { message: "をアップしてください"}
  validates :image, length: {maximum: 5, message: "は5枚以上投稿できません"}
end
