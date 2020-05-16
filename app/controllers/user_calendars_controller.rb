class UserCalendarsController < ApplicationController

	def index
		@calendars = UserCalendar.where(user: current_user)
		@new_calendar = UserCalendar.new
	end

	def create
		@new_calendar = UserCalendar.new(user_calendar_params)
		@new_calendar.user = current_user
		if @new_calendar.save
			redirect_to user_calendars_path
		else 
			render :index
		end
	end

	def destroy
		@calendar = UserCalendar.find(params[:id])
		@calendar.destroy
		redirect_to user_calendars_path
	end

	private 

	def user_calendar_params
		params.require(:user_calendar).permit(:date)
	end
end
