class SessionsController < ApplicationController
  def new
    @admin_user = AdminUser.new
  end

  def create
  # ログにセッション情報を表示
  Rails.logger.debug("Session user_id: #{session[:user_id]}")
  email = params[:email] # パラメータからemailを取得
  password = params[:password] # パラメータからpasswordを取得

  @admin_user = AdminUser.find_by(email: email) # emailを使ってAdminUserを検索

  if @admin_user && @admin_user.authenticate(password)
    session[:admin_user_id] = @admin_user.id
    redirect_to tasks_path, notice: 'ログインしました'
  else
    flash.now[:alert] = 'ログインに失敗しました'
    render :new
  end
  end

  def destroy
    session[:admin_user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
