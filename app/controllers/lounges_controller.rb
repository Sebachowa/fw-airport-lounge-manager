require 'net/http'
require 'json'
require 'date'

class LoungesController < ApplicationController

  def new
    @lounge = Lounge.new()
    @services = Service.all
  end

  def create
    lounge_params = params.require(:lounge).permit(:name, :price, :description, :is_legacy, :capacity)
    services_params = params.require(:lounge).permit(:services => []).reject { |c| c.empty? }

    lounge = Lounge.create(lounge_params)
    services_params[:services].each do |service|
      lounge_service = LoungeService.create( { service_id: service.to_i, lounge_id: lounge[:id] } )
    end
    redirect_to admin_path
  end


  #TODO - THIS CONTROLLER IS TOO FAT
  def show
    id = params[:id]
    @lounge = Lounge.find(id)
    p "--------------------------------------------"
    p @lounge.services
    @booking = Booking.new
    bookings = Booking.where(lounge_id: id)
    if @lounge[:is_legacy] == true
      @availability = Availability.where(lounge_id: id)
      bookings.each do |booking|
        @availability.map do |avai| 
          if avai[:date] == Date.parse(booking[:date_time])
            avai[:remaining] -= booking[:total_people]
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
          if avai[:date] == Date.parse(booking[:date_time])
            avai[:remaining] -= booking[:total_people]
          else
            avai
          end
        end
      end
    end
  end

  def edit
    id = params[:id]
    @lounge = Lounge.find(id)
  end

  def update
    lounge_params = params.require(:lounge).permit(:name, :price, :description, :capacity)
    lounge = Lounge.find(params[:id])
    lounge.update(lounge_params)
    redirect_to admin_path
  end

  def destroy
    lounge = Lounge.find(params[:id])
    lounge.delete
    redirect_to admin_path
  end

  def booking
    @lounge = params[:id]
    @user = current_user
  end
end
