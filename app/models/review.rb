class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking
  has_one :service, through: :booking
  after_save :service_avg_rating

  validates :rating,
    presence: true,
    inclusion: { in: 0..5 },
    numericality: { only_integer: true }

  validates :user, presence: true
  validates :booking, presence: true


  private
  def service_avg_rating
    number_of_ratings = self.service.reviews.count
    sum_ratings = Review.joins(:booking).where('service_id = ?', self.service.id).sum(:rating)
    if number_of_ratings.zero?
      self.service.avg_rating = 0
    else
      self.service.avg_rating = sum_ratings.fdiv(number_of_ratings).round(1)
    end
    self.service.save!
  end
end
