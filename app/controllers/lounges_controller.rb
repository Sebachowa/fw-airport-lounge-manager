require 'net/http'
require 'json'

class LoungesController < ApplicationController

  def new
    lounge_params = params.require(:lounge).permit(:name, :price, :description, :capacity)
    lounge = Lounge.new(lounge)
    if lounge.save
      redirect_to admin_path
    end
  end

  def show
    id = params[:id]
    @lounge = Lounge.find(id)
    @booking = Booking.new
    if @lounge[:is_legacy] == true
      @availability = getAvailabilityByLounge(@lounge[:feed_id])
    end
  end


  def booking
    @lounge = params[:id]
    @user = current_user
  end


  def getAvailabilityByLounge (id)
    url = URI.parse('http://fw-rubycodetest.herokuapp.com/api/v1/lounges/availability')
    req = Net::HTTP::Get.new(url.to_s)
    req["Authorization"] = "KA7LQ67rzkPThLwUwUG4GyGkN"
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    if res.content_type == "text/html"
      getAvailabilityByLounge(id)
    else
      availability = JSON.parse(res.body)
      lounge_availability = availability.find_all { |lounge| lounge["lounge_id"] == id }
    end
  end
end
