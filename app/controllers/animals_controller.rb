class AnimalsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :destroy]
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
      params[:images][:image_url].each do |image|
        @animal.images.create!(image_url: image, animal_id: @animal.id)
      end
      redirect_to root_path
    else
      redirect_to new_animal_path
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
