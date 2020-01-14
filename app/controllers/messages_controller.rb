class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :access_limit

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to animal_room_path(animal_id: params[:animal_id], id: params[:room_id])
    else
      redirect_to animal_room_path(animal_id: params[:animal_id], id: params[:room_id])
      flash.now[:notice] = "送信に失敗しました"
    end
  end

  private

    def message_params
      params.require(:message).permit(:content).merge(room_id: params[:room_id], user_id: current_user.id)
    end

    def access_limit
      @room = Room.find(params[:room_id])
      if @room.host_id != current_user.id && @room.client_id != current_user.id
        redirect_to room_path
      end
    end
end