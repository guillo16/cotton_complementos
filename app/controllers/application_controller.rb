class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_division
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_action

  private

  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def set_division
    @divisions = Division.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address, :city, :state, :postal, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :address, :city, :state, :postal, :phone])
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end


