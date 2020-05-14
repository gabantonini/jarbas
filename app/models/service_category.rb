class ServiceCategory < ApplicationRecord
	has_many :services, dependent: :destroy
	validates :name, presence: true
	has_one_attached :photo
	validates :photo, presence: true
	validates :description, presence: true
end
