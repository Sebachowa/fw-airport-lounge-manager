class ApiController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def lounge_availability_per_day
    date = request.query_parameters["date"]
    availabilities = Availability.where({date_time: date})
    msg = { :status => "ok", :data => availabilities }
    render :json => msg

  end
  
  def lounge_book
    booking_params = params.require(:api).permit(:date, :user_id, :lounge_id, :total_people)

    if !booking_params[:user_id] || !booking_params[:lounge_id] || !booking_params[:date] || !booking_params[:total_people]
      msg = { :status => "error", :message => "Unproccesable entity" }
      render :json => msg
    end
  
    if !User.find(booking_params[:user_id])
      msg = { :status => "error", :message => "Incorrect user id" }
      render :json => msg
    end

    if !Lounge.find(booking_params[:lounge_id])
      msg = { :status => "error", :message => "Incorrect lounge id" }
      render :json => msg
    end
    
    new_booking = Booking.new({
      user_id: booking_params[:user_id],
      lounge_id: booking_params[:lounge_id],
      date_time: booking_params[:date],
      total_people: booking_params[:total_people]
    })

    if new_booking.save
      msg = { :status => "ok", :message => "Booking created" }
      render :json => msg
    else
      msg = { :status => "error", :message => "Cannot create booking" }
      render :json => msg
    end
  end
end
