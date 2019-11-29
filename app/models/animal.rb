class Animal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #validation

  #association
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :users
  belongs_to :taker, class_name: 'User', optional: true
  belongs_to :giver, class_name: 'User'
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
end
