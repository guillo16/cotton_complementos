class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @divisions = Division.all
  end
end
