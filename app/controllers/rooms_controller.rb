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
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def transaction
    @animal = Animal.find(params[:animal_id])
    @room = Room.find(params[:room_id])
    if @animal.update(taker_id: @room.users[1].id)
      redirect_to user_path(@room.users[0].id)
    else
      redirect_to animals_path
    end
  end

  def done
  end

  private

  def room_params
    params.require(:room).permit(:animal_id, user_ids:[])
  end

  def set_params
    @room = Room.find(params[:id])
  end
end