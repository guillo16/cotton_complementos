class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_division

  private

  def set_division
    @divisions = Division.all
  end
end
