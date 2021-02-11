class ShippingsController < ApplicationController
  def new
    @shipping = Shipping.new
  end

  def create
    cart = Cart.find(params[:cart_id])
    redirect_to new_shipping_path
  end
end
