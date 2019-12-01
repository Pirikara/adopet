class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #validation

  # associate
  has_many :animals
  has_many :comments
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :took_animals, foreign_key: "taker_id", class_name: "Animal"
  has_many :giving_animals, -> { where("taker_id is NULL") }, foreign_key: "giver_id", class_name: "Animal"
  has_many :gived_animals, -> { where("taker_id is not NULL") }, foreign_key: "giver_id", class_name: "Animal"
  mount_uploader :icon, ImageUploader
  def remember_me
    true
  end
end
