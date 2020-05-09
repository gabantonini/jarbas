class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :review, dependent: :destroy

  def add_review?
  	(["Realizado", "Cancelado"].include?(status)) & (self.review.nil?)
  end
end
