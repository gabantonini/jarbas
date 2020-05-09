class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :review, dependent: :destroy

  def add_review?
  	(["Realizado", "Cancelado"].include?(status)) && (self.review.nil?)
  end
  
  def self.pending_reviews?(user)
     my_bookings = Booking.where('user_id = ? AND status = ? AND date > ?', user.id, "Realizado", Date.today - 7)
     my_bookings.count.zero? ? false : my_bookings.count
  end
end
