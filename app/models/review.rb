class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking
  has_one :service, through: :booking

  validates :rating,
    presence: true,
    inclusion: { in: 0..5 },
    numericality: { only_integer: true }

  validates :user, presence: true
  validates :booking, presence: true
end
