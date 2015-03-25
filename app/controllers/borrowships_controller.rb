class BorrowshipsController < ApplicationController
  def create
    @borrowship = current_user.borrowships.build(borrowship_params)
    if @borrowship.save
      flash[:notice] = "Request sent to the lender!"
      redirect_to root_url
    else
      flash[:notice] = "Unable to add request."
      redirect_to root_url
    end
  end

  private

  def borrowship_params
    params.require(:borrowship).permit(:borrower_id, :lender_id, :dvd_id)
  end
end
