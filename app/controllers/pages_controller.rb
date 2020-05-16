class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  	@categories = ServiceCategory.all
  	
  	@users = User.geocoded

  	@markers = @users.map do |user|
 		{
 			lat: user.latitude,
 			lng: user.longitude,
 		}
  	end
  end
end
