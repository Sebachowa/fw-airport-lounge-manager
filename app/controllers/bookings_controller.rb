class BookingsController < ApplicationController

  def new
    lounge = Lounge.find(params[:id])
    booking_params = params.require(:booking).permit(:user_id, :date, :is_with_metting_room, :is_with_gim, :is_with_spa, :total_people)
    if booking_params["is_with_metting_room"] == "1"
      booking_params["total_people"] = (booking_params["total_people"].to_i + 1).to_s
    else
      booking_params["total_people"] = "1"
    end
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user[:id]
    @booking.lounge_id = lounge[:id]
    if @booking.save
      redirect_to root_path
    else
      render lounge_detail
    end
  end
end


# require 'net/http'
# require 'uri'
# require 'json'


# url = URI.parse(`http://fw-rubycodetest.herokuapp.com/api/v1/lounges/#{lounge[:feed_id]}/book`)



# req = Net::HTTP::Post.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
#   http.request(req)
# }
# if res.content_type == "text/html"
#   getAvailabilityByLounge(id)
# else
#   availability = JSON.parse(res.body)
#   lounge_availability = availability.find_all { |lounge| lounge["lounge_id"] == id }
# end




# uri = URI.parse("http://fw-rubycodetest.herokuapp.com/api/v1/lounges/1/book")

# header = {'Content-Type': 'text/json'}
# user = {user: {
#   name: 'Bob',
#   email: 'bob@example.com'
# }
# }

# # Create the HTTP objects
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Post.new(uri.request_uri, header)
# request["Authorization"] = "KA7LQ67rzkPThLwUwUG4GyGkN"

# request.body = user.to_json

# # Send the request
# response = http.request(request)