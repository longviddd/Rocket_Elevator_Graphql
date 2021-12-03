class Elevator < ApplicationRecord
  belongs_to :column
  has_many :intervention
end
