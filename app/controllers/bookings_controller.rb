class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings

  end

  def create
    @yacht = Yacht.find(params[:yacht_id])
    @booking = @yacht.bookings.create(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to root_path, notice: 'Booking was successfully created.'
    else
      render 'yachts/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date)
  end
end
