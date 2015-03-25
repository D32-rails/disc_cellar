class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @user = User.all
    @dvds = Dvd.where(id: params[:user_dvds])
  end

  def edit
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Thank you for your request."
    else
      render :edit
    end
  end

  def show
    @dvds = @user.dvds.all
    @borrowship = Borrowship.create
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :role)
  end
end
