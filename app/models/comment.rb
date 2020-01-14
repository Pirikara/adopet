class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  #validates
  validates :text, presence: true
  validates :text, length: { maximum: 20 }
end