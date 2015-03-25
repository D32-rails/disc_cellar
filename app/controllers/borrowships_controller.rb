class BorrowshipsController < ApplicationController
  def index
    @borrowships = Borrowship.all
  end

  def show
    @borrowship = current_user.borrowships
  end

  def create
    @borrowship = Borrowship.create(borrowship_params)
    if @borrowship.save
      redirect_to user_path(@borrowship.lender.id), notice: "Request sent to lender!"
    else
      redirect_to user_path(@borrowship.lender.id), notice: "Unable to request the DVD"
    end
  end

  def update
    @borrowship = Borrowship.find(params[:id])
    if @borrowship.update(borrowship_params)
      flash[:notice] = "Something went right!"
      redirect_to dvds_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to dvds_path
    end
  end

  private

  def borrowship_params
    params.require(:borrowship).permit(:borrower_id, :lender_id, :dvd_id)
  end
end
