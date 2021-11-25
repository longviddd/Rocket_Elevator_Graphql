class BuildingDetail < ApplicationRecord
  belongs_to :building
  establish_connection :production
end
