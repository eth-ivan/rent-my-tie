class BookingsController < ApplicationController

  def my_bookings
    @bookings = Booking.where(user_id: params[:user_id])
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @tie = Tie.find(params[:ty_id])
    @user = current_user # temporary, to be able to save the tie
    @booking = Booking.new(booking_params)
    @booking.tie = @tie
    @booking.user_id = @user.id
    if @booking.save
      redirect_to ty_path(@tie)
    else
      render "ties/show" # render method is necessary so that simple form displays error messages
    end
  end

  def destroy
    Booking.find(params[:id]).destroy
    flash[:success] = "Reservacion eliminada"
    redirect_to my_bookings_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
