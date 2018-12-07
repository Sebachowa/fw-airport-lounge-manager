class ApiController < ApplicationController
  skip_before_action :authenticate_user!

  def lounge_availability_per_day
    date = request.query_parameters["date"]
    availabilities = Availability.where({date_time: date})
    msg = { :status => "ok", :data => availabilities }
    render :json => msg

  end
  
  def lounge_book

  end
end
