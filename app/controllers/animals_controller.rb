class AnimalsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @animals = Animal.all
  end

  def new
    if user_signed_in?
      @animal = Animal.new
      @images = @animal.images.build
    else
      redirect_to root_path
    end
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      @animal.images.build
      render :new
    end
  end
  
  def show
    @comment = Comment.new
    @comments = @animal.comments.includes(:user)
  end

  def edit
  end

  def update
  end

  def destroy
    if @animal.destroy
      redirect_to animals_path
    else
      redirect_to animal_path(@animal.id)
      :javascript
        alert('削除できませんでした。');
    end
  end

  private

    def animal_params
      params.require(:animal).permit(
        :name,
        :description,
        :category_id,
        :prefecture_id,
        :gender_id,
        images_attributes: [:image_url]).merge(giver_id: current_user.id)
    end

    def set_params
      @animal = Animal.find(params[:id])
    end
end
