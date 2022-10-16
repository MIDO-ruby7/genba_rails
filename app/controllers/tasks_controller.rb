class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました"
  end

  def create
<<<<<<< HEAD
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to @tasks_url, notice: "タスク「#{@task.name}」を登録しました"
    else
      render :new
    end
=======
    task = Task.new(task_params) 
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました"
>>>>>>> cdd0ddceff0e22c9c5a1127c5291a7ebd0b87e53
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました"
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
