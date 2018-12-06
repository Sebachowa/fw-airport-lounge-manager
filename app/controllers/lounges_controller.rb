require 'net/http'
require 'json'

class LoungesController < ApplicationController

  def new
    lounge_params = params.require(:lounge).permit(:name, :price, :description, :capacity)
    lounge = Lounge.new(lounge_params)
    if lounge.save
      redirect_to admin_path
    end
  end

  def show
    id = params[:id]
    @lounge = Lounge.find(id)
    @booking = Booking.new
    if @lounge[:is_legacy] == true
      @availability = Availability.where(lounge_id: id)
    end
  end

  def booking
    @lounge = params[:id]
    @user = current_user
  end
end
