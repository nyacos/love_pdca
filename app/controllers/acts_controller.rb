class ActsController < ApplicationController
  before_action :set_act, only: %i[ show edit update destroy ]
  before_action :line_login_authenticate_user!, only: [:show]
  
  helper_method :current_user

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
    @comments = @act.comments.includes(:user).order(created_at: :desc)
    @comment = current_user.comments.new if current_user
  end

  def new
    @act = Act.new
  end

  def edit
  end

  def create
    current_user = User.find(session[:user_id])
    @act = current_user.acts.build(act_params)
    respond_to do |format|
      if @act.save
        format.html { redirect_to act_url(@act), notice: "Action was successfully created." }
        format.json { render :show, status: :created, location: @act }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @act.update(act_params)
        format.html { redirect_to act_url(@act), notice: "Action was successfully updated." }
        format.json { render :show, status: :ok, location: @act }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @act.destroy

    respond_to do |format|
      format.html { redirect_to acts_url, notice: "Action was successfully destroyed." }
      format.json { head :no_content }
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
      @act = Act.find(params[:id])
    end

    def act_params
      params.require(:act).permit(:title, :body)
    end
end
