class ChargesController < ApplicationController
  def index
    if current_user.admin?
      @charges = Charge.all
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end

  def show
    if current_user.admin?
      @charge = Charge.find(params[:id])
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end

  def create
    product = Product.find(params[:product_id])
    charge = Charge.create!(product: product, user: current_user)
    ChargeMailer.with(charge: charge).new_charge.deliver_later
    redirect_to root_path
    flash[:notice] = "Producto Encargado, lo contactaremos pronto , Muchas Gracias"
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to charges_path
  end
end
