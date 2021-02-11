class ShippingsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @shipping = Shipping.new(shipping_params)
    @shipping.order = @order
    if @shipping.save
      flash[:notice] = "Acceso garantizado!"
      @order.update(total: @order.total.to_i + @shipping.amount)
      redirect_to new_order_payment_path(@order)
    else
      render 'payments/new'
      flash[:notice] = "Accesso denegado!"
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      @shipping.order.update(total: @shipping.order.amount.to_i + @shipping.amount)
      redirect_to new_order_payment_path(@shipping.order.id)
    else
      render :edit
    end
  end


  private

  def shipping_params
    params.require(:shipping).permit(:address, :phone, :amount)
  end

end


