require 'date'

class BookingsController < ApplicationController
  def new
    lounge = Lounge.find(params[:id])
    booking_params = params.require(:booking).permit(:date_time, :total_people)
    services_params = params.require(:booking).permit(:services => []).reject { |c| c.empty? }
    
    if services_params[:services].include? '1'
      booking_params["total_people"] = (booking_params["total_people"].to_i + 1).to_s
    else
      booking_params["total_people"] = "1"
    end

    new_booking = Booking.create({
      user_id: current_user[:id],
      lounge_id: lounge[:id],
      date_time: booking_params[:date_time],
      total_people: booking_params[:total_people]
    })
    p new_booking
    services_params[:services].each do |service|
      new_booking_service = BookingService.create({ booking_id: new_booking[:id], service_id: service.to_i})
      p new_booking_service
    end
   redirect_to root_path
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