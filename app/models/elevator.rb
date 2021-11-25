class Elevator < ApplicationRecord
  belongs_to :column
  establish_connection :production
end
