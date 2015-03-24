class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @user = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Thank you for your request."
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:address, :role)
  end
end
