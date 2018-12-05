class PagesController < ApplicationController
  def home
    @lounges = [1,2,3,4,5,6,7,8,9]
    #@lounges = Lounges.all
  end
end
