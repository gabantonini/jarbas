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
  belongs_to :service_category
  validates :service_category, presence: true

  def rating
    reviews = self.reviews
    sum_ratings = reviews.map { |review| review.rating}.sum
    # sum_ratings = Review.select('rating').joins(bookings: [{service: Service.first}]) - NOT WORKING
    number_of_ratings = reviews.count
    if number_of_ratings.zero?
      "No rating yet"
    else
      sum_ratings.fdiv(number_of_ratings).round(1)
    end
  end
end
