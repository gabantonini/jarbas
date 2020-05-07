class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :service, through: :booking
  # need to add has_many to booking and users 

  validates :rating,
    presence: true,
    numericality: { only_integer: true },
    inclusion: { in: 0..5 }

  validates :user, presence: true
  validates :booking, presence: true
end
