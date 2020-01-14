class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:show]
  before_action :access_limit, only: [:create, :transaction]
  
  def new
    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    #同一ユーザーが同じ動物に対して複数のroomを作成できないようにする
    rooms = Room.where(animal_id: room.animal_id, host_id: room.host_id, client_id: room.client_id)
    if rooms == []
      if room.save
        redirect_to animal_room_path(animal_id: room.animal_id, id: room.id)
      else
        redirect_to animal_room_path(animal_id: room.animal_id, id: room.id)
        flash.now[:notice] = "チャットルームの作成に失敗しました"
      end
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

  private

  def room_params
    params.require(:room).permit(:animal_id, :host_id, :client_id)
  end

  def set_params
    @room = Room.find(params[:id])
  end

  #里親決定済みの動物に関するアクセス制限
  def access_limit
    @animal = Animal.find(params[:animal_id])
    if @animal.taker_id.present?
      redirect_to animal_path(@animal.id)
    end
  end
end