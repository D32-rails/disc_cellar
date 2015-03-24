class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def edit
    set_user
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
