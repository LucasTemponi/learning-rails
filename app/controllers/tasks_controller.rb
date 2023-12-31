class TasksController < ApplicationController
  before_action :logged_in

  def index
    @tasks = Task.order(:position)
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.order(:id) || []
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @count = Task.count
    @task = Task.new(position: @count + 1)
    @categories = Category.order(:id) || []
  end

  def create
    puts(params)
    @task = Task.new(task_params)
    @category = Category.find(task_params[:category_id])
    if @task.save
      @category.tasks << @task
      redirect_to tasks_path
    else
      render('new')
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end

  def toggle_complete
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
  end

  def delete; end

  def destroy; end

  private

  def task_params
    params.require(:task).permit(:name, :position, :completed, :description, :category_id)
  end
end
