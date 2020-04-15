class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @divisions = Division.all
    @products = Product.all
  end
end
