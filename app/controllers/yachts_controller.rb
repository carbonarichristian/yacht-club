class YachtsController < ApplicationController

  def index
    @yachts = Yacht.all
  end

   def show
     @yacht = Yacht.find(params[:id])
   end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    if @yacht.save
      redirect_to yacht_path(@yacht)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @yacht = Yacht.find(params[:id])
  end

   def update
    if yacht.update(yacht_params)
      redirect_to yacht_path(@yacht)
    else
      render :edit, status: :unprocessable_entity
    end
   end
   
  private

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:list).permit(:name, :photo)
  end

end
