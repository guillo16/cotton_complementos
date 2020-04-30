class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: ENV['ADMIN_EMAIL'], subject: "Tienes una nueva orden!")
  end
end
