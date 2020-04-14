class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @divisions = Division.all
    @category = Category.find(params[:id])
    @categories = Category.all
  end
end
