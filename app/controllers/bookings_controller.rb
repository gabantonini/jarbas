class BookingsController < ApplicationController

    def index
        @my_bookings = Booking.where('user_id = ?', current_user.id)
        @my_services_booked = Booking.joins('JOIN services ON services.id = bookings.service_id').where('services.user_id = ?', current_user.id) 
      end
    
      def show
        @booking = Booking.find(params[:id])
      end
    
      def new
        @service = Service.find(params[:service_id])
        @booking = Booking.new
        @booking.service = @service
      end
    
      def create
        @service = Service.find(params[:service_id])
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.service = @service
        @booking.status = "Aguardando confirmação"
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
          params.require(:booking).permit(:date)
      end
  
end
