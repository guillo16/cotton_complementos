class DivisionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @division = Division.find(params[:id])
    categories = @division.categories
    @products = Product.where(category_id: categories).page params[:page]
  end
end
