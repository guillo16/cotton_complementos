# Preview all emails at http://localhost:3000/rails/mailers/charge_mailer
class ChargeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/charge_mailer/new_charge
  def new_charge
    ChargeMailer.new_charge
  end

end
