class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  has_one :service, through: :booking

  validates :rating,
    presence: true,
    inclusion: { in: 0..5 },
    numericality: { only_integer: true }

  validates :user, presence: true
  validates :booking, presence: true
end
