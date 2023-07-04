class CategoriesController < ApplicationController
  def index
  end

  def show
    @categories = Categories.order(:position)
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
