class Animal < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #validation
  validates :name,
            :description,
            :category_id,
            :prefecture_id,
            :gender_id, 
            :giver_id,
            :images, presence: true

  validates :name, length: { maximum: 6 }
  
  #association
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :users
  has_many :comments
  has_many :rooms
  belongs_to :taker, class_name: 'User', optional: true
  belongs_to :giver, class_name: 'User'
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :gender

  #method
  def self.search(search)
    #いけてる
    if search[:name] == "" && search[:prefecture_id] != "" && search[:category_id] != ""
      Animal.where("(prefecture_id = ?) AND (category_id = ?)", search[:prefecture_id], search[:category_id])
    #いけてない
    elsif  search[:name] == "" && search[:prefecture_id] == "" && search[:category_id] != ""
      Animal.where(category_id: search[:category_id])
    #いけてない
    elsif search[:name] == "" && search[:prefecture_id] != "" && search[:category_id] == ""
      Animal.where(prefecture_id: search[:prefecture_id])
    #いけてる
    elsif search[:name] != "" && search[:prefecture_id] != "" && search[:category_id] != ""
      Animal.where("(name LIKE(?)) AND (prefecture_id = ?) AND (category_id = ?)", "%#{search[:name]}%",search[:prefecture_id], search[:category_id])
    #いけてる
    elsif search[:name] != "" && search[:prefecture_id] != "" && search[:category_id] == ""
      Animal.where("(name LIKE(?)) AND (prefecture_id = ?)", "%#{search[:name]}%", search[:prefecture_id])
    #いけてる
    elsif search[:name] != "" && search[:prefecture_id] == "" && search[:category_id] != ""
      Animal.where("(name LIKE(?)) AND (category_id = ?)", "%#{search[:name]}%", search[:category_id])
    #いけてる
    elsif search[:name] != "" && search[:prefecture_id] == "" && search[:category_id] == ""
      Animal.where("name LIKE(?)", "%#{search[:name]}%")
    elsif search[:name] == "" && search[:prefecture_id] == "" && search[:category_id] == ""
      Animal.all
    end
  end
end