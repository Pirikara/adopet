class Room < ApplicationRecord
  belongs_to :animal
  has_many :messages
  belongs_to :host, class_name: "User"
  belongs_to :client, class_name: "User"
end