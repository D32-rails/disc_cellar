class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]

  # GET /dvds
  # GET /dvds.json
  def index
    @dvds = Dvd.all
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
  end

  # GET /dvds/new
  def new
    @dvd = Dvd.new
  end

  # GET /dvds/1/edit
  def edit
  end

  # POST /dvds
  # POST /dvds.json
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

  # PATCH/PUT /dvds/1
  # PATCH/PUT /dvds/1.json
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

  # DELETE /dvds/1
  # DELETE /dvds/1.json
  def destroy
    @dvd.destroy
    respond_to do |format|
      format.html { redirect_to dvds_url, notice: 'Dvd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dvd
      @dvd = Dvd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dvd_params
      params.require(:dvd).permit(:genre, :year, :rated, :published)
    end
end
