class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    @search = params[:search]
    if @search.present?
      @query = @search[:query]
      @services = Service.where("name ILIKE ?", "%#{@query}%")
    end
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
  	@service = Service.new(service_params)
    @service.user = current_user
    @service.save ? (redirect_to service_path(@service)) : (render :new)
  end

  def edit
  end

  def update
    @service.update(service_params) ? (redirect_to service_path(@service)) : (render :edit)
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def find_service
  	@service = Service.find(params[:id])
  end

  def service_params
  	params.require(:service).permit(:name, :description, :price, :time_to_answer, :disponibility, :service_category_id, :photo)
  end
end
