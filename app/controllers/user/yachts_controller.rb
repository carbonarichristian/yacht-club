class User::YachtsController < ApplicationController
  def index
    @yachts = current_user.yachts
  end
end
