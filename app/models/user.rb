class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :zip_code, :with => /\A^\d{5}-\d{3}$\Z/i
  has_one_attached :photo
  has_many :services, dependent: :destroy 
  has_many :service_categories, through: :services
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  belongs_to :condominio
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
