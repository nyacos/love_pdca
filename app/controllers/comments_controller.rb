class CommentsController < ApplicationController
  before_action :set_act
  before_action :line_login_authenticate_user!
  
  def index
    @comments = Comment.where(act_id: @act.id) 
  end

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to act_path(comment.act), success: 'Comment was successfully created'
    else
      redirect_to act_path(comment.act), danger: 'Failed to create comment.'
    end
  end

  private

  def line_login_authenticate_user!
    # LINEログインの認証処理を実装
    # 例: セッションに保存されたユーザー情報を基に認証を行う
    unless session[:user_id]
      redirect_to root_path, alert: "ログインしてください。"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_act
    @act = Act.find(params[:act_id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(act_id: params[:act_id])
  end
end
