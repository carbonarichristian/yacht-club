class User::BookingsController < ApplicationController
  before_action :set_booking, only: [:update]
  def index
    @yachts = current_user.yachts
  end

  def update
    @booking.update(set_params)
    redirect_to my_bookings_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:status)
  end

end
