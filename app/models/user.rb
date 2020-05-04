class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :zip_code, numericality: { only_integer: true }
         validates :zip_code, length: { is: 8 }
         has_one_attached :photo
end
