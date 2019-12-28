class RoomsController < ApplicationController
  before_action :set_params, only: [:show]
  def new
    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    rooms = Room.where(animal_id: room.animal_id, host_id: room.host_id, client_id: room.client_id)
    if rooms == []
      room.save
      redirect_to animal_room_path(animal_id: room.animal_id, id: room.id)
    else
      redirect_to animal_path(id: room.animal_id)
    end
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @room = Room.find(params[:id])
    @host = User.find(@room.host_id)
    @client = User.find(@room.client_id)
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end


  def transaction
    @animal = Animal.find(params[:animal_id])
    @room = Room.find(params[:room_id])
    @user = User.find(@room.client_id)
    if @animal.update(taker_id: @user.id)
      redirect_to user_path(current_user.id)
    else
      redirect_to animals_path
    end
  end

  def unsuccessful
    @room = Room.find(params[:room_id])
    if @room.update(status_id: 1)
      redirect_to user_path(@room.users[0].id)
    else
      redirect_to animals_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:animal_id, :host_id, :client_id)
  end

  def set_params
    @room = Room.find(params[:id])
  end
end