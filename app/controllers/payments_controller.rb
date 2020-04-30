class PaymentsController < ApplicationController
 before_action :set_order

 def new
 end

 def create
    # DESTROY CART
    @cart = Cart.find(session[:cart_id])
    session[:cart_id] = nil
    @order.update(state: 'Encargado')
    redirect_to order_path(@order)
    OrderMailer.with(order: @order).new_order_email.deliver_later

  end

  private

  def set_order
    @order = current_user.orders.where(state: 'Pendientes').find(params[:order_id])
  end
end
