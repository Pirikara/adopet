class Animal < ApplicationRecord
  #validation

  #association
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :users
  belongs_to :category
  belongs_to :area
end
