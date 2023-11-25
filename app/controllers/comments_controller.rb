class CommentsController < ApplicationController
  before_action :set_act

  def index
    @comments = Comment.where(act_id: @act.id) 
  end

  def create
    @comment = Comment.new(comment_params)
    # @comment.act = @act # コメントに関連するアクションを設定

    # respond_to do |format|
      if @comment.save
        redirect_back(fallback_location: root_path)
        # format.html { redirect_to act_path(@act), success: t('defaults.message.created', item: Comment.model_name.human) }
      else
        redirect_back(fallback_location: root_path)
        # format.html { redirect_to act_path(@act), danger: t('defaults.message.not_created', item: Comment.model_name.human) }
      end
    # end
  end

  private

  def set_act
    @act = Act.find(params[:act_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :act_id)
  end
end
