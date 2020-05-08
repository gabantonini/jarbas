class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
      end
    
      def show
        @booking = Booking.find(params[:id])
      end
    
      def new
        @booking = Booking.new
      end
    
      def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.save ? (redirect_to booking_path(@booking)) : (render :new)
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
          params.require(:booking).permit(:service_id, :user_id, :date, :status)
      end
  
end
