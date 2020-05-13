class Service < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  validates :price, numericality: true
  validates :time_to_answer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :disponibility, presence: true
  validates :user, presence: true
  belongs_to :service_category
  validates :service_category, presence: true

  def rating
    number_of_ratings = self.reviews.count
    sum_ratings = Review.joins(:booking).where('service_id = ?', self.id).sum(:rating)
    if number_of_ratings.zero?
      "No rating yet"
    else
      sum_ratings.fdiv(number_of_ratings).round(1)
    end
  end
end
