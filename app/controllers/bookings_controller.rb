class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @tie.user = current_user # temporary, to be able to save the tie
    if @booking.save
      redirect_to @tie
    else
      render :new # render method is necessary so that simple form displays error messages
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
