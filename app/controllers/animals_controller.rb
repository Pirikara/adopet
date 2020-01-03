class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :user_access_limit, only: [:edit, :update, :destroy]

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
    if @animal.update(animal_update_params)
      redirect_to animal_path(@animal.id)
    else
      render :edit
    end
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

  def search
    @animals = Animal.search(search_params)
  end

  private

    def animal_params
      params.require(:animal).permit(
        :name,
        :description,
        :category_id,
        :prefecture_id,
        :gender_id,
        [images_attributes: [:image]]).merge(giver_id: current_user.id)
    end

    def animal_update_params
      params.require(:animal).permit(
        :name,
        :description,
        :category_id,
        :prefecture_id,
        :gender_id,
        [images_attributes: [:image, :_destroy, :id]]).merge(giver_id: current_user.id)
    end

    def set_params
      @animal = Animal.find(params[:id])
    end

    def search_params
      params.fetch(:search, {}).permit(:name, :prefecture_id, :category_id)
    end

    #ログイン中のユーザーが動物の投稿者でない場合、詳細ページにリダイレクトされる
    def user_access_limit
      @animal = Animal.find(params[:id])
      if current_user.id != @animal.giver_id
        redirect_to animal_path(@animal.id)
      end
    end
end
