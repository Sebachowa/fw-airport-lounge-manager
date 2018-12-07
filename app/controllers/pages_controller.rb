class PagesController < ApplicationController
  # before_action :start_background_job
  
  def home
    @lounges = Lounge.all
  end
  
  def admin
    @lounges = Lounge.all
    @services = Service.all
    @bookings = Booking.all
    @lounge = Lounge.new()
    @service = Service.new()
    if current_user.is_admin == false
      redirect_to root_path
    end
  end
  
  # private
  
  # def start_background_job
  #   ApiFetchWorker.perform_async()
  # end

end