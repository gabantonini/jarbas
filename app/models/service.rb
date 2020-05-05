class Service < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :condominio
end
