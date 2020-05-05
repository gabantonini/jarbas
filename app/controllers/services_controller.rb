class ServicesController < ApplicationController
  before_action :find_service, only: [:show]

  def show
  end

  def new
    @service = Service.new
  end

  def create
  	@service = Service.new(service_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_service
  	@service = Service.find(params[:id])
  end

  def service_params
  	params.require(:service).permit(:name, :description, :price, :time_to_answer, :disponibiity, :photo)
  end
end
