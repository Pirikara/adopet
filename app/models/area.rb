class Area < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #validation
  #association
  has_many :animals
  belongs_to_active_hash :prefecture
end
