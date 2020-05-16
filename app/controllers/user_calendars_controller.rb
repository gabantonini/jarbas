class UserCalendarsController < ApplicationController

	def index
		@calendars = UserCalendar
			.where('user_id = ? AND date >= ?', current_user.id, Date.today)
			.order(:date)
		@new_calendar = UserCalendar.new
	end

	def create
		dates = user_calendar_params[:date]
			.split(", ")
			.map { |date_as_string| date_as_string.to_date}
		
		results = []

		dates.each do |date|
			@new_calendar = UserCalendar.new(date: date)
			@new_calendar.user = current_user
			results << @new_calendar.save
		end

		redirect_to user_calendars_path
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
