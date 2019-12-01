class RoomsController < ApplicationController
  before_action :set_params, only: [:show]
  def new
    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    rooms = Room.where(animal_id: room.animal_id)
    exist = rooms.each do |r|
      room_users = RoomUser.where(room_id: r.id, user_id: current_user.id)
    end
    if exist == []
      room.save
      redirect_to animal_room_path(animal_id: room.animal_id, id: room.id)
    else
      redirect_to animal_path(id: room.animal_id)
    end
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  private

  def room_params
    params.require(:room).permit(:animal_id, user_ids:[])
  end

  def set_params
    @room = Room.find(params[:id])
  end
end