class AnimalsController < ApplicationController
  def index
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
  end
  
  def show
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
        :area_id,
        images_attributes: [:image_url]
        ).merge(user_id: current_user.id)
    end
end
