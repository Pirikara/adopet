class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def self.new_message(room)
    #最新のメッセージを１件取得
    @message = self.order(created_at: :desc).find_by(room_id: room)
  end
end
