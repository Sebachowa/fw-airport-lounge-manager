class ServicesController < ApplicationController
  def new
    service_params = params.require(:service).permit(:name, :price, :picture)
    service = Service.new(service_params)
    if service.save
      redirect_to admin_path
    end
  end
end
