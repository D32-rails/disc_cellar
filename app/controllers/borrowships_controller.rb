class BorrowshipsController < ApplicationController
  def create
    @borrowship = current_user.borrowships.build(borrowship_params)
    # if @borrowship.save
    #   flash[:notice] = "Request sent to the lender!"
    #   redirect_to dvds_path
    # else
    #   flash[:notice] = "Unable to add request."
    #   redirect_to dvds_path
    # end
  end

  def update
    @borrowship = Borrowship.find(params[:id])
    if @borrowship.update(borrowship_params)
      flash[:notice] = "Request sent to lender!"
      redirect_to dvds_path
    else
      flash[:notice] = "Unable to request the DVD"
      redirect_to dvds_path
    end
  end

  private

  def borrowship_params
    params.require(:borrowship).permit(:borrower_id, :lender_id, :dvd_id)
  end
end
