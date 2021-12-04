module Types
  class MutationType < Types::BaseObject
    field :update_pending_intervention, mutation: Mutations::UpdatePendingIntervention
    field :update_in_progress_intervention, mutation: Mutations::UpdateInProgressIntervention
    field :update_complete_intervention, mutation: Mutations::UpdateCompleteIntervention
    field :update_elevator_status, mutation: Mutations::UpdateElevatorStatus
    field :update_column_status, mutation: Mutations::UpdateColumnStatus
    field :update_battery_status, mutation: Mutations::UpdateBatteryStatus
    
    
  end
end
