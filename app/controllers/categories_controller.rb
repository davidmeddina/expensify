# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update edit destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def create
    if @category.save
      redirect_to categories_path
      flash[:notice] = 'Categoria creada'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
