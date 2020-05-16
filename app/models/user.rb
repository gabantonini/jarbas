class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :zip_code, :with => /\A^\d{5}[-]?\d{3}$\Z/i
  has_one_attached :photo
  has_many :services, dependent: :destroy 
  has_many :service_categories, through: :services
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :user_calendars
  belongs_to :condominio, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def blocked_dates
    booking_dates = bookings_by_date

    full_dates = booking_dates
      .select { |date_array| date_array[1] >= 2 }
      .map { |date_array| date_array[0].to_s }

    return blocked_dates = (full_dates + calendar_dates).uniq
  end

  def bookings_by_date
    Booking.joins(:service)
      .where('services.user_id = ? AND bookings.date > ?', self.id, Date.today)
      .group(:date)
      .count
      .to_a
  end

  def calendar_dates
    UserCalendar.where('user_id = ? AND date >= ?', id, Date.today)
      .map { |calendar| calendar.date.to_s }
      .to_a
  end
end
