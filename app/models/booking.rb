class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :review, dependent: :destroy


  def pending_confirmation?
    self.status == "Aguardando confirmação"
  end

  def declined?
    self.status == "Declinado"
  end
  def confirmed?
    self.status == "Confirmado"
  end


  def add_review?
  	(["Realizado", "Cancelado"].include?(status)) && (self.review.nil?)
  end
  
  def self.pending_reviews?(user)
     my_bookings = Booking.where('user_id = ? AND status = ? AND date > ?', user.id, "Realizado", Date.today - 7)
     my_bookings_without_review = []
     my_bookings.each do |booking|
      my_bookings_without_review << booking if booking.review.nil? 
     end
     my_bookings_without_review.count.zero? ? false : my_bookings_without_review.count
  end

end
