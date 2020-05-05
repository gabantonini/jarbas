class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates_format_of :zip_code, :with => /\A^\d{5}-\d{3}$\Z/i, :on => :create
         has_one_attached :photo
end
