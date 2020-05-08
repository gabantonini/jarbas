class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :review
end
