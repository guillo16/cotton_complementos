class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_division
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_division
    @divisions = Division.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address, :city, :state, :postal, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :address, :city, :state, :postal, :phone])
  end
end
