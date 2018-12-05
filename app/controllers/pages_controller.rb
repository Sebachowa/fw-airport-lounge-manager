class PagesController < ApplicationController
  def home
    @lounges = Lounge.all
  end

  def admin
    @lounges = Lounge.all
    @services = Service.all
    @lounge = Lounge.new()
    @service = Service.new()
    if current_user.is_admin == false
      redirect_to root_path
    end
  
  end
end
