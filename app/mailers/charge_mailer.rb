class ChargeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.charge_mailer.new_charge.subject
  #
  def new_charge
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
