class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path
      flash[:notice] = "Accesso denegado!"
    end
  end
end
