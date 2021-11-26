module Mutations
  class UpdateBatteryStatus < BaseMutation
    argument :id, ID, required: true
    argument :status, String, required:false
    field :battery, Types::BatteryType, null:true
    field :success, Boolean, null: false
    field :errors, [String], null: false
    def authorized?(**args)
      super

      # E.g. with Pundit
      # super &&
      #   BookPolicy.new(context[:current_user], Record.find_by(id: args[:id])).update?
    end
    def resolve(id:, **args)
      record = Battery.find(id)
      if record.update(args)
        { success: true, battery: record, errors: [] }
      else
        { success: false, battery: nil, errors: record.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      return { success: false, book: nil, errors: ['record-not-found'] }
    end
    
  end
end
