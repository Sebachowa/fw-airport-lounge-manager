class ServicesController < ApplicationController
  def new
    @service = Service.new()
    @services = Service.all
  end

  def create
    service_params = params.require(:service).permit(:name, :price, :picture)
    service = Service.new(service_params)
    if service.save
      redirect_to admin_path
    end
  end

  def edit
    id = params[:id]
    @service = Service.find(id)
  end

  def update
    service_params = params.require(:service).permit(:name, :price, :picture)
    service = Service.find(params[:id])
    service.update(service_params)
    redirect_to admin_path
  end

  def destroy
    service = Service.find(params[:id])
    service.delete
    redirect_to admin_path
  end
end
