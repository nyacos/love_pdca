class DoosController < ApplicationController
  before_action :set_doo, only: %i[ show edit update destroy ]
  before_action :authorize_user, only: [:update, :destroy]

  def index
    @doos = Doo.all
  end

  def show
  end

  def new
    @doo = Doo.new
  end

  def edit
  end

  def create
    @doo = Doo.new(doo_params)

    respond_to do |format|
      if @doo.save
        format.html { redirect_to doo_url(@doo), notice: "Do was successfully created." }
        format.json { render :show, status: :created, location: @doo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @doo.update(doo_params)
        format.html { redirect_to doo_url(@doo), notice: "Do was successfully updated." }
        format.json { render :show, status: :ok, location: @doo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doo.destroy

    respond_to do |format|
      format.html { redirect_to doos_url, notice: "Do was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_doo
      @doo = Doo.find(params[:id])
    end

    def doo_params
      params.require(:doo).permit(:title, :content)
    end

    def authorize_user
      unless @doo.user == current_user
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to root_path
      end
    end
end
