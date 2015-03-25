class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]
  # before_filter :verify_authorized, only: [:edit, :destroy]

  def index
    @dvds = Dvd.all
  end

  def show
  end

  def new
    @dvd = Dvd.new
  end

  def edit
  end

  def create
    @dvd = Dvd.new(dvd_params)
    if @dvd.save
      if @dvd.published?
        redirect_to @dvd, notice: "#{@dvd.title} has been added."
      else
        redirect_to @dvd, notice: "Thank you for your request."
      end
    else
      render :new
    end
  end

  def update
    @user = current_user
    @dvd = Dvd.find(params[:id])
    @user.dvds << @dvd

    if @dvd.update(dvd_params)
      if @dvd.published?
        redirect_to dvds_path
      else
        redirect_to @dvd, notice: "Thank you for your request."
      end
    else
      render :edit
    end
  end

  def destroy
    @dvd.destroy
    redirect_to dvds_url, notice: "This DVD has been deleted."
  end

  private

  def set_dvd
    @dvd = Dvd.find(params[:id])
  end

  def verify_authorized
    @dvd = Dvd.find(params[:id])
    authorize @dvd
  end

  def dvd_params
    params.require(:dvd).permit(:genre, :year, :rated, :published, :title)
  end
end
