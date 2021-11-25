class Employee < ApplicationRecord
  belongs_to :user
  establish_connection :production
end
