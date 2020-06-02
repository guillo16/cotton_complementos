class ChargesController < ApplicationController
  def index
    @charges = Charge.all
  end

  def show
    @charge = Charge.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    Charge.create!(product: product, user: current_user)
    redirect_to root_path
    flash[:notice] = "Gracias por su mensaje, lo contactaremos pronto"
  end
end
