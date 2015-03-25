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
      redirect_to dvds_path, notice: "Your profile has been updated."
    else
      render :edit
    end
  end

  def show
    @dvds = @user.dvds.all
    @borrowship = Borrowship.new
  end

  def destroy
    @user = current_user
    @user.dvds.find(params[:dvd_id]).destroy

    redirect_to article_comments_path(@article)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user][:dvd_ids] = params[:user][:dvd_ids].split(" ").map(&:to_i)
    params.require(:user).permit(:name, :address, :role, dvd_ids:[])
  end
end
