class VariantsController < ApplicationController
  def show
    @variant = Variant.find(params[:id])
  end

  def create
    @product = Product.find(params[:product_id])
    @variant = Variant.new(variant_params)
    @variant.product = @product
    if @variant.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  def edit
    @variant = Variant.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:id])
    @variant.update(variant_params)
    redirect_to variant_path(@variant)
  end

  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy
    redirect_to products_path
  end

  private

  def variant_params
    params.require(:variant).permit(:title, :stock)
  end
end
