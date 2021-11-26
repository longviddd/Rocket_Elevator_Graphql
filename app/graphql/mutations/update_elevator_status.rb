module Mutations
  class UpdateElevatorStatus < BaseMutation
    argument :id, ID, required: true
    argument :status, String, required:false
    field :elevator, Types::ElevatorType, null:true
    field :success, Boolean, null: false
    field :errors, [String], null: false
    def authorized?(**args)
      super

      # E.g. with Pundit
      # super &&
      #   BookPolicy.new(context[:current_user], Record.find_by(id: args[:id])).update?
    end
    def resolve(id:, **args)
      record = Elevator.find(id)
      if record.update(args)
        { success: true, elevator: record, errors: [] }
      else
        { success: false, elevator: nil, errors: record.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      return { success: false, elevator: nil, errors: ['record-not-found'] }
    end
  end
end
