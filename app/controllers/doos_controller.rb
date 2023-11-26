class DoosController < ApplicationController
  before_action :set_doo, only: %i[ show edit update destroy ]

  # GET /doos or /doos.json
  def index
    @doos = Doo.all
  end

  # GET /doos/1 or /doos/1.json
  def show
  end

  # GET /doos/new
  def new
    @doo = Doo.new
  end

  # GET /doos/1/edit
  def edit
  end

  # POST /doos or /doos.json
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

  # PATCH/PUT /doos/1 or /doos/1.json
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

  # DELETE /doos/1 or /doos/1.json
  def destroy
    @doo.destroy

    respond_to do |format|
      format.html { redirect_to doos_url, notice: "Do was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doo
      @doo = Doo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doo_params
      params.require(:doo).permit(:title, :content)
    end
end
