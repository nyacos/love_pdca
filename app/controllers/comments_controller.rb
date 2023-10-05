class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to act_path(@comment.act), success: t('defaults.message.created', item: Comment.model_name.human)
    else
      redirect_to act_path(@comment.act), danger: t('defaults.message.not_created', item: Comment.model_name.human)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(act_id:params[:act_id])
  end
end
