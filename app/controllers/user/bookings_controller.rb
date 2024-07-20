class User::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def index
    @yachts = current_user.yachts
  end


  def edit
  end

  def update
    @booking.update(set_params)
    redirect_to bookings_path(@booking)
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:status)
  end

end
