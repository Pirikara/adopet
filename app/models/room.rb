class Room < ApplicationRecord
  belongs_to :animal
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
end