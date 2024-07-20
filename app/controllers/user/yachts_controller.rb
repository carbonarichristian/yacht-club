class User::YachtsController < ApplicationController
  def index
    @yachts = current_user.yachts
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

end
