module Types
  class MutationType < Types::BaseObject
    field :update_elevator_status, mutation: Mutations::UpdateElevatorStatus
    field :update_column_status, mutation: Mutations::UpdateColumnStatus
    field :update_battery_status, mutation: Mutations::UpdateBatteryStatus
    
    
  end
end
