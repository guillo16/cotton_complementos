class ChargeMailer < ApplicationMailer
  def new_charge
    @charge = params[:charge]
    mail(to: ENV["ADMIN_EMAIL"], subject: "Tienes un encargo!")
  end
end
