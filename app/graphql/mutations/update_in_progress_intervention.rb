module Mutations
  class UpdateInProgressIntervention < BaseMutation
    argument :id, ID, required: true
    field :intervention, Types::InterventionType, null:true
    field :success, Boolean, null: false
    field :errors, [String], null: false
    def resolve(id:)
      record = Intervention.find(id)
      if record.update(:status => "InProgress")
        { success: true, intervention: record, errors: [] }
      else
        { success: false, intervention: nil, errors: record.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      return { success: false, elevator: nil, errors: ['record-not-found'] }
    end
  end
end
