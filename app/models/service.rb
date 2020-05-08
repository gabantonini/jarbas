class Service < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  validates :price, numericality: true
  validates :time_to_answer, numericality: { only_integer: true }
  validates :disponibility, presence: true
  validates :user, presence: true
end
