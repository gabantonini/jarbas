class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
      end
    
      def show
        @booking = Booking.find(params[:id])
      end
    
      def new
        @service = Service.find(params[:service_id])
        @booking = Booking.new
        @booking.user = current_user
        @booking.service = @service
      end
    
      def create
        @service = Service.find(params[:service_id])
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.service = @service
        @booking.save ? (redirect_to service_booking_path(@service, @booking)) : (render :new)
      end
    
      def edit
        @booking = Booking.find(params[:id])
      end
    
      def update
        @booking = Booking.find(params[:id])
        @booking.update(booking_params) ? (redirect_to booking_path(@booking)) : (render :edit)
      end
    
      def destroy
        @booking.destroy
        redirect_to bookings_path
      end
    
      private

      def booking_params
          params.require(:booking).permit(:date)
      end
  
end
