class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id)
  end

  def show
    @categories = Category.find(params[:id])
    @tasks = @categories.tasks
  end

  def new
    @category = Category.new
  end

  def create
    category_params = params.require(:category).permit(:name)
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render('new')
    end
  end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
