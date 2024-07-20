class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @yacht = Yacht.find(params[:yacht_id])
    @booking = @yacht.bookings.new
    @booking.user = current_user
    @booking.value = @booking.value
    @total_price = @booking.value.to_f * (@booking.to_date - @booking.from_date).to_f
  end
  def create
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.user = current_user
    @booking.status = "Pending host validation"
    if @booking.from_date && @booking.to_date
      @booking.value = @booking.yacht.price.to_f * (@booking.to_date - @booking.from_date).to_f
    else
      @booking.value = 0
    end
    if @booking.save
      redirect_to roots_path, notice: 'Booking was successfully created.'
    else
      redirect_to yacht_path(@yacht), notice: 'Booking was not created.'
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @yacht = @booking.yacht
  end

  def edit
  end
  
  def update
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to bookings_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:from_date, :to_date, :user_id, :yacht_id)
  end
end
