class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_products, only: %i[show edit update destroy]

  def index
    if current_user.admin?
      @products = Product.all
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
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
      flash[:notice] = "Accesso denegado!"
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

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :category_id, photos: [])
  end
end
