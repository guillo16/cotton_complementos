class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @products = Product.all
  end

  def index
    if current_user.admin?
      @users = User.order(created_at: :asc)
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end
end
