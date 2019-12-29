class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.create(comment_params)
    redirect_to "/animals/#{comment.animal.id}"
  end

  private

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, animal_id: params[:animal_id])
    end
end
