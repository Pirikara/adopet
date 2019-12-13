class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.new_message(room)
    #最新順にした上でfind_byメソッドを使用
    @message = self.order(created_at: :desc).find_by(room_id: room)
  end
end
