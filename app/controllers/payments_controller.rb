class PaymentsController < ApplicationController
  before_action :set_order, only: %w[new create]

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    require 'mercadopago.rb'
    mp = MercadoPago.new(ENV['ACCESS_TOKEN'])
    # Crea un objeto de preferencia
    preference_data = {
      "items": [
        {
          "title": "Total",
          "unit_price": @order.amount.to_i,
          "quantity": 1,
          "currency_id": "ARS"
        }
      ]
    }
    @preference = mp.create_preference(preference_data)
    @preference_id = @preference["response"]["id"]
    @shipping = Shipping.new
    ACCESS_TOKEN=TEST-4172019108926178-021314-b2f2034cf02d63f6135dc75afbea4744-403897306

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


