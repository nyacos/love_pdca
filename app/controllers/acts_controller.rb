class ActsController < ApplicationController
  before_action :set_act, only: %i[ show edit update destroy ]
  helper_method :current_user

  # GET /acts or /acts.json
  def index
    @acts = Act.all
  end

  # GET /acts/1 or /acts/1.json
  def show
  end

  # GET /acts/new
  def new
    @act = Act.new
  end

  # GET /acts/1/edit
  def edit
  end

  # POST /acts or /acts.json
  def create
    # @act = Act.new(act_params)
    current_user = User.find(session[:user_id])
    @act = current_user.acts.build(act_params)
    respond_to do |format|
      if @act.save
        format.html { redirect_to act_url(@act), notice: "Action was successfully created!" }
        format.json { render :show, status: :created, location: @act }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1 or /acts/1.json
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

  # DELETE /acts/1 or /acts/1.json
  def destroy
    @act.destroy

    respond_to do |format|
      format.html { redirect_to acts_url, notice: "Action was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def act_params
      params.require(:act).permit(:title, :body)
    end
end
