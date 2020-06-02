class ChargesController < ApplicationController
  def index
    @charges = Charge.all
  end

  def show
    @charge = Charge.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    charge = Charge.create!(product: product, user: current_user)
    ChargeMailer.with(charge: charge).new_charge.deliver_later
    redirect_to root_path
    flash[:notice] = "Producto Encargado, lo contactaremos pronto , Muchas Gracias"
  end
end
