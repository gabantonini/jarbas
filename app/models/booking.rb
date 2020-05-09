class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  has_one :review, dependent: :destroy

  def pending_confirmation?
    self.status == "Aguardando confirmação"
  end

  def declined?
    self.status == "Declinado"
  end
  def confirmed?
    self.status == "Confirmado"
  end

end
