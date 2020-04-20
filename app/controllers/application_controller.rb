class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_division
  include CurrentCart
  before_action :set_cart

  private

  def set_division
    @divisions = Division.all
  end
end
