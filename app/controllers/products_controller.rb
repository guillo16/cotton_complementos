class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :search]
  before_action :set_products, only: %i[show edit update destroy]

  def index
    @categories = Category.order(title: :asc)
    if current_user.admin?
      @products = Product.all
      if params["category_id"]
        @products = Product.where(category_id: params["category_id"]).order(price_cents: :asc)
      elsif params["price_cents"]
        @products = Product.order(price_cents: :desc)
      else
        @products
      end
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end

  def contact
    @product = Product.find(params[:product_id])
  end

  def search
    if params[:query].present?
      sql_query = " \
      products.title @@ :query \
      OR categories.title @@ :query \
      "
      @products = Product.joins(:category).where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all
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
    redirect_to product_path(@product)
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
    params.require(:product).permit(:title, :price, :description, :sale, :category_id, photos: [])
  end
end
