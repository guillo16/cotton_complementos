class PaymentsController < ApplicationController
  before_action :set_order, only: %w[new create]

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @shipping = Shipping.new
  end

  def create
    # DESTROY CART
    @cart = Cart.find(session[:cart_id])
    session[:cart_id] = nil
    @payment = Payment.create!(title: "nuevo payment", order: @order, user: current_user)
    @order.update(state: 'Encargado')
    OrderMailer.with(order: @order).new_order_email.deliver_later
    redirect_to order_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(state: 'Pendientes').find(params[:order_id])
  end
end


