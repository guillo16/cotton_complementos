class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    if params["created_at"]
      @products = @category.products.order(created_at: :desc)
    elsif params["price_cents"]
      @products = @category.products.order(price_cents: :asc)
    elsif params["min_price"]
      @products = @category.products.where("price_cents BETWEEN ? AND ?", params["min_price"], params["max_price"]).order(price_cents: :desc)
    else
      @products
    end
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :division_id)
  end
end
