class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
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
  end

  def create
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
