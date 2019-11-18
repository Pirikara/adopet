class Animal < ApplicationRecord
  #validation

  #association
  has_many :users
  belongs_to :category
  belongs_to :area
end
