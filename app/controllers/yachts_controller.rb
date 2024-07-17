class YachtsController < ApplicationController
  before_action :set_yacht, only: [:show, :edit, :update, :destroy]

  def index
    @yachts = Yacht.all
  end

  def show
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    if @yacht.save
      redirect_to @yacht, notice: 'Yacht was successfully created.'
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
