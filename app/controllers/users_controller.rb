class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
    @animals = Animal.where(giver_id: @user.id)
  end

  def edit
  end

  def update
  end

end
