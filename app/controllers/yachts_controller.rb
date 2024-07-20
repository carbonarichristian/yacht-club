class YachtsController < ApplicationController
  before_action :set_yacht, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @yachts = Yacht.all
  end

  def show
    @yacht = Yacht.find(params[:id])
    @booking = Booking.new
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    if (@from_date && @to_date)
      from = @from_date.split("/")
      to = @to_date.split("/")
      start = Date.new(from[2], from[1], from[0])
      finish = Date.new(to[2], to[1], to[0])
      @days = (finish - start).to_f
      @total_price = (@days * @yacht.price).to_f
    end
    @bookings = @yacht.bookings
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.create(yacht_params)
    @yacht.user = current_user
    if @yacht.save
      redirect_to yacht_path(@yacht) , notice: 'Yacht was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @yacht.update(yacht_params)
      redirect_to @yacht, notice: 'Yacht was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @yacht.destroy
    redirect_to yachts_url, notice: 'Yacht was successfully destroyed.'
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:yacht).permit(:name, :model, :price, :photo)
  end
end
