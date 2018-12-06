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

  #TODO - THIS CONTROLLER IS TOO FAT
  def show
    id = params[:id]
    @lounge = Lounge.find(id)
    @booking = Booking.new
    bookings = Booking.where(lounge_id: id)
    if @lounge[:is_legacy] == true
      @availability = Availability.where(lounge_id: id)
      bookings.each do |booking|
        @availability.map do |avai| 
          if avai[:date] == booking.date
            avai[:remaining] -= booking.total_people
          else
            avai
          end
        end
      end
    else
      @availability = []
      for item in (0...20) do
        avai_hash = {
          date: Date.today + item,
          remaining: @lounge.capacity
        }
        @availability.push(avai_hash)
      end

      bookings.each do |booking|
        @availability.map do |avai| 
          if avai[:date] == booking.date
            avai[:remaining] -= booking.total_people
          else
            avai
          end
        end
      end
    end
  end

  def booking
    @lounge = params[:id]
    @user = current_user
  end
end
