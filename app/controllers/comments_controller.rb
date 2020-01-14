class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/animals/#{comment.animal.id}"
    else
      redirect_to "/animals/#{comment.animal.id}"
      flash.now[:notice] = "送信に失敗しました"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, animal_id: params[:animal_id])
    end
end
