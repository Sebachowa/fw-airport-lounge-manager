class PagesController < ApplicationController
  def home
    @lounges = Lounge.all
  end
end
