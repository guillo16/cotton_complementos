class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @order = Order.sum('amount_cents') * 0.01
      @orders = Order.all
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end

  def show
    @order = current_user.orders.where(state: 'Encargado').find(params[:id])
  end

  def create
    cart = Cart.find(params[:cart_id])
    order = Order.create!(amount: cart.total_price, state: 'Pendientes', user: current_user, cart: cart)
    redirect_to new_order_payment_path(order)
  end
end
