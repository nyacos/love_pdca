class ChecksController < ApplicationController
  before_action :set_check, only: %i[ show edit update destroy ]

  def index
    @checks = Check.all
  end

  def show
  end

  def new
    @check = Check.new
  end

  def edit
  end

  def create
    @check = Check.new(check_params)

    respond_to do |format|
      if @check.save
        format.html { redirect_to check_url(@check), notice: "Check was successfully created." }
        format.json { render :show, status: :created, location: @check }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @check.update(check_params)
        format.html { redirect_to check_url(@check), notice: "Check was successfully updated." }
        format.json { render :show, status: :ok, location: @check }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @check.destroy

    respond_to do |format|
      format.html { redirect_to checks_url, notice: "Check was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_check
      @check = Check.find(params[:id])
    end

    def check_params
      params.require(:check).permit(:title, :content)
    end
end
