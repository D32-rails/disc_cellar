class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to @dvd, notice: 'Dvd was successfully created.' }
        format.json { render :show, status: :created, location: @dvd }
      else
        format.html { render :new }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dvd.update(dvd_params)
        format.html { redirect_to @dvd, notice: 'Dvd was successfully updated.' }
        format.json { render :show, status: :ok, location: @dvd }
      else
        format.html { render :edit }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dvd.destroy
    respond_to do |format|
      format.html { redirect_to dvds_url, notice: 'Dvd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_dvd
    @dvd = Dvd.find(params[:id])
  end

  def dvd_params
    params.require(:dvd).permit(:genre, :year, :rated, :published, :title)
  end
end
