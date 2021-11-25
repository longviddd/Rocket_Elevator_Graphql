class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :buildings, dependent: :destroy
  establish_connection :production

  def to_s 
    "Customer #" + self.id.to_s
  end
end
