class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_products, only: %i[show destroy]
  def index
  end

  def show
    @products = Product.all
    @variant = Variant.new
  end

  def new
    if current_user.admin?
      @product = Product.new
    else
      redirect_to root_path
      notice
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :photo, :category_id)
  end
end
