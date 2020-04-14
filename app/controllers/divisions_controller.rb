class DivisionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @division = Division.find(params[:id])
  end
end