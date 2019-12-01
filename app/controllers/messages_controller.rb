class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    redirect_to animal_room_path(animal_id: params[:animal_id], id: params[:room_id])
  end

  private

    def message_params
      params.require(:message).permit(:content).merge(room_id: params[:room_id], user_id: current_user.id)
    end
end