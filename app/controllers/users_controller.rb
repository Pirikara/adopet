class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
    @animals = Animal.where(giver_id: @user.id)
    #host_idもしくはclient_idが詳細ページもとのuseridであるRoomを抽出
    @rooms = Room.where("(host_id = ?) OR (client_id = ?)", @user.id, @user.id)
  end

  def edit
  end

  def update
  end

end
