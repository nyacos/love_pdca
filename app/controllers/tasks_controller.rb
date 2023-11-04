class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    # パラメータからカテゴリー名を取得
    category_name = params[:task][:category]
  
    # カテゴリー名に対応するCategoryオブジェクトをデータベースから検索
    category = Category.find_by(name: category_name)
  
    # カテゴリーが存在しない場合、新しいカテゴリーを作成
    unless category
      category = Category.create(name: category_name)
    end
  
    # タスクを作成する際に正しいカテゴリーオブジェクトを使用
    @task = Task.new(task_params)
    @task.category = Category.find(params[:task][:category_id])
  
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "#{category_name.upcase} was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "PLAN was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :category_id)
    end
end
